//
//  HomeView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 06/11/23.
//

//import SwiftUI
//import UIKit

//struct ImageModifier: ViewModifier {
//    
//    private var contentSize: CGSize
//    private var min: CGFloat = 1.0
//    private var max: CGFloat = 3.0
//    @State var currentScale: CGFloat = 1.0
//    
//    init(contentSize: CGSize) {
//        self.contentSize = contentSize
//    }
//    
//    var doubleTapGesture: some Gesture {
//        TapGesture(count: 2).onEnded {
//            if currentScale <= min {currentScale = max} else
//            if currentScale >= max {currentScale = min} else {
//                currentScale = ((max - min) * 0.5 + min) < currentScale ? max : min
//            }
//        }
//    }
//    
//    func body(content: Content) -> some View {
//        ScrollView([.horizontal, .vertical]) {
//            content
//                .frame(width: contentSize.width * currentScale, height: contentSize.height * currentScale, alignment: .center)
//                .modifier(PinchToZoom(minScale: min, maxScale: max, scale: $currentScale))
//        }
//        .gesture(doubleTapGesture)
//        .animation(.easeInOut, value: currentScale)
//    }
//    
//}
//
//class PinchToZoom: UIView {
//    let minScale: CGFloat
//    let maxScale: CGFloat
//    var isPinching: Bool = false
//    var scale: CGFloat = 1.0
//    let scaleChange: (CGFloat) -> Void
//    
//    init(minScale: CGFloat, maxScale: CGFloat, currentScale: CGFloat, scaleChange: @escaping (CGFloat) -> Void) {
//        self.minScale = minScale
//        self.maxScale = maxScale
//        self.scale = currentScale
//        self.scaleChange = scaleChange
//        super.init(frame: .zero)
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
//        pinchGesture.cancelsTouchesInView = false
//        addGestureRecognizer(pinchGesture)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//struct HomeView: View {
//    
//    @State private var currentZoom = 0.0
//    @State private var totalZoom = 1.0
//    
//    var body: some View {
//        VStack {
//            Image("linha-prata")
//                .scaleEffect(currentZoom + totalZoom)
//            //                .gesture(
//            //
//            //                )
//            
//        }
//        
//    }
//}

