//
//  ImageModifier.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 09/11/23.
//

import SwiftUI
import UIKit

struct ImageModifier: ViewModifier {
    @Environment(\.screenSize) var screenSize
    @Binding private var contentSize: CGSize
    private let min: CGFloat = 1.0
    private let max: CGFloat = 4.0
    @State var currentScale: CGFloat = 1.0
    @State var previousScale: CGFloat = 1.0
    
    @State var location: CGPoint = CGPoint.zero
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                newLocation.x = newLocation.x.clamped(to: -getBorderLimit() ... screenSize.width  + getBorderLimit()) // 30 ... 2090
                newLocation.y = newLocation.y.clamped(to: -getBorderLimit(byHeight: true) ... screenSize.height + getBorderLimit(byHeight: true)) // 30 ... 1290
                self.location = newLocation
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location
            }
    }
    
    var fingerDrag: some Gesture {
        DragGesture()
            .updating($fingerLocation) { (value, fingerLocation, transaction) in
                fingerLocation = value.location
            }
    }

    init(contentSize: Binding<CGSize>) {
        self._contentSize = contentSize
    }
    
    var doubleTapGesture: some Gesture {
        SpatialTapGesture(count: 2).onEnded { event in
            // zoom out to zoom in
            if currentScale <= min {
                currentScale = max
            }
            
            // zoom in to zoom out
            else if currentScale >= max {
                currentScale = min
                location = getCenterLocation()
            }
            
            // altered zoom value
            else {
                if (max - min) * 0.5 + min > currentScale {
                    currentScale = max
                } else {
                    currentScale = min
                    location = getCenterLocation()
                }
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                location = getCenterLocation()
            }
            .frame(width: contentSize.width, height: contentSize.height)
            .position(location)
            .modifier(PinchToZoom(minScale: min, maxScale: max, scale: $currentScale))
            .gesture(doubleTapGesture)
            .gesture(simpleDrag.simultaneously(with: fingerDrag))
            .animation(.easeInOut, value: currentScale)
    }
    
    private func getCenterLocation() -> CGPoint {
        return .init(x: screenSize.width / 2, y: screenSize.height / 2)
    }
    
    private func getInverseLocation(to location: CGPoint) -> CGPoint {
        let center = getCenterLocation()
        
        let xValue: CGFloat = location.x < center.x ? 1 : -1
        let yValue: CGFloat = location.y < center.y ? 1 : -1
        
        let xDiff: CGFloat = (center.x - location.x) * xValue
        let yDiff: CGFloat = (center.y - location.y) * yValue
        
        return .init(x: center.x + xDiff, y: center.y + yDiff)
    }
    
    private func getBorderLimit(byHeight: Bool = false) -> CGFloat {
        let minBorderValue: CGFloat = getBorderMultiplierByDevice(byMin: true, byHeight: byHeight)
        let maxBorderValue: CGFloat = getBorderMultiplierByDevice(byHeight: byHeight)
        
        let maxBorderDiff: CGFloat = maxBorderValue - minBorderValue
        let maxScaleDiff: CGFloat = self.max - self.min
        
        let currentScalePercentage: CGFloat = (100 * (self.currentScale - self.min)) / maxScaleDiff
        let currentBorderValue: CGFloat = (maxBorderDiff * currentScalePercentage) / 100
        
        return currentBorderValue + minBorderValue
    }
    
    private func getBorderMultiplierByDevice(byMin: Bool = false, byHeight: Bool = false) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            if byMin {
                return byHeight ? screenSize.height * -0.25 : screenSize.width * -0.30
            } else {
                return byHeight ? screenSize.height * -0.25 : screenSize.width * -0.08
            }
            
        default:
            if byMin {
                return byHeight ? screenSize.height * -0.08 : screenSize.width * 0.08
            } else {
                return byHeight ? screenSize.height * -0.10 : screenSize.width * 0.44
            }
        }
    }
}

class PinchZoomView: UIView {
    let minScale: CGFloat
    let maxScale: CGFloat
    var isPinching: Bool = false
    var scale: CGFloat = 1.0
    let scaleChange: (CGFloat) -> Void
    
    init(minScale: CGFloat,
         maxScale: CGFloat,
         currentScale: CGFloat,
         scaleChange: @escaping (CGFloat) -> Void) {
        self.minScale = minScale
        self.maxScale = maxScale
        self.scale = currentScale
        self.scaleChange = scaleChange
        super.init(frame: .zero)
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        pinchGesture.cancelsTouchesInView = false
        addGestureRecognizer(pinchGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func pinch(gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            isPinching = true
            gesture.scale = scale
            
        case .changed, .ended:
            if gesture.scale <= minScale {
                scale = minScale
            } else if gesture.scale >= maxScale {
                scale = maxScale
            } else {
                scale = gesture.scale
            }
            scaleChange(scale)
        case .cancelled, .failed:
            isPinching = false
            scale = 1.0
        default:
            break
        }
    }
}

struct PinchZoom: UIViewRepresentable {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @Binding var isPinching: Bool
    
    func makeUIView(context: Context) -> PinchZoomView {
        let pinchZoomView = PinchZoomView(minScale: minScale, maxScale: maxScale, currentScale: scale, scaleChange: { scale = $0 })
        return pinchZoomView
    }
    
    func updateUIView(_ pageControl: PinchZoomView, context: Context) { }
}

struct PinchToZoom: ViewModifier {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @State var isPinching: Bool = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: .center)
            .animation(.spring(), value: isPinching)
            .overlay(PinchZoom(minScale: minScale, maxScale: maxScale, scale: $scale, isPinching: $isPinching))
    }
}

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}


