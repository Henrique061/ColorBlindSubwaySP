//
//  LineFocusComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 27/11/23.
//

import SwiftUI

struct LineFocusComponent: View {
    @Environment(\.screenSize) var screenSize
    var mapVm: MapViewModel
    var line: LineCase
    @Binding var circleColor: Color
    
    init(mapVm: MapViewModel, circleType: LineCase) {
        self.mapVm = mapVm
        self.line = circleType
        self._circleColor = mapVm.bindingLineColor(for: circleType)
    }
    
    var body: some View {        
        VStack {
            Button {
                self.mapVm.changeLineOpacity(line: line)
            } label: {
                if mapVm.focusedLines.contains(line) {
                    FocusedLineComponent(circleColor: $circleColor)
                        .frame(width: screenSize.width * 0.127, alignment: .center)
                        .padding()
                } else {
                    Circle()
                        .fill(circleColor)
                        .shadow(radius: screenSize.width * 0.005, y: screenSize.height * 0.005)
                        .frame(width: screenSize.width * 0.127, alignment: .center)
                        .padding()
                }
            }.onAppear {
                print("width: \(screenSize.width) | height: \(screenSize.height)")
            }
            
            Text(line.title)
                .font(.system(size: screenSize.width * 0.030).weight(.bold))
        }
    }
}

struct FocusedLineComponent: View {
    @Environment(\.screenSize) var screenSize
    @Binding var circleColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: .init(lineWidth: screenSize.width * 0.013))
                .foregroundStyle(circleColor)
            
            FocusLineCheckmark()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.5)
                .foregroundStyle(circleColor)
        }
    }
}

struct FocusLineCheckmark: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.39402*width, y: 0.96462*height))
        path.addCurve(to: CGPoint(x: 0.30469*width, y: 0.92356*height), control1: CGPoint(x: 0.35814*width, y: 0.96462*height), control2: CGPoint(x: 0.32836*width, y: 0.95094*height))
        path.addLine(to: CGPoint(x: 0.03447*width, y: 0.60063*height))
        path.addCurve(to: CGPoint(x: 0.01172*width, y: 0.56567*height), control1: CGPoint(x: 0.02374*width, y: 0.58842*height), control2: CGPoint(x: 0.01616*width, y: 0.57677*height))
        path.addCurve(to: CGPoint(x: 0.00562*width, y: 0.53016*height), control1: CGPoint(x: 0.00765*width, y: 0.55458*height), control2: CGPoint(x: 0.00562*width, y: 0.54274*height))
        path.addCurve(to: CGPoint(x: 0.03336*width, y: 0.46136*height), control1: CGPoint(x: 0.00562*width, y: 0.50242*height), control2: CGPoint(x: 0.01486*width, y: 0.47949*height))
        path.addCurve(to: CGPoint(x: 0.10438*width, y: 0.43362*height), control1: CGPoint(x: 0.05222*width, y: 0.44286*height), control2: CGPoint(x: 0.0759*width, y: 0.43362*height))
        path.addCurve(to: CGPoint(x: 0.18206*width, y: 0.47024*height), control1: CGPoint(x: 0.13545*width, y: 0.43362*height), control2: CGPoint(x: 0.16135*width, y: 0.44582*height))
        path.addLine(to: CGPoint(x: 0.3918*width, y: 0.72547*height))
        path.addLine(to: CGPoint(x: 0.80795*width, y: 0.07018*height))
        path.addCurve(to: CGPoint(x: 0.84624*width, y: 0.03078*height), control1: CGPoint(x: 0.82016*width, y: 0.05168*height), control2: CGPoint(x: 0.83292*width, y: 0.03855*height))
        path.addCurve(to: CGPoint(x: 0.89506*width, y: 0.01913*height), control1: CGPoint(x: 0.85955*width, y: 0.02302*height), control2: CGPoint(x: 0.87583*width, y: 0.01913*height))
        path.addCurve(to: CGPoint(x: 0.96553*width, y: 0.04688*height), control1: CGPoint(x: 0.92355*width, y: 0.01913*height), control2: CGPoint(x: 0.94704*width, y: 0.02838*height))
        path.addCurve(to: CGPoint(x: 0.99383*width, y: 0.11512*height), control1: CGPoint(x: 0.9844*width, y: 0.065*height), control2: CGPoint(x: 0.99383*width, y: 0.08775*height))
        path.addCurve(to: CGPoint(x: 0.98884*width, y: 0.14675*height), control1: CGPoint(x: 0.99383*width, y: 0.12511*height), control2: CGPoint(x: 0.99216*width, y: 0.13565*height))
        path.addCurve(to: CGPoint(x: 0.97219*width, y: 0.18004*height), control1: CGPoint(x: 0.98551*width, y: 0.15748*height), control2: CGPoint(x: 0.97996*width, y: 0.16858*height))
        path.addLine(to: CGPoint(x: 0.48557*width, y: 0.91857*height))
        path.addCurve(to: CGPoint(x: 0.39402*width, y: 0.96462*height), control1: CGPoint(x: 0.46486*width, y: 0.94927*height), control2: CGPoint(x: 0.43434*width, y: 0.96462*height))
        path.closeSubpath()
        return path
    }
}
