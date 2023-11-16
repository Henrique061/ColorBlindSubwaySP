//
//  MapView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct MapView: View {
    @StateObject var mapVm = MapViewModel()
    @State var mapSize: CGSize = .init(width: 400, height: 400)
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // LINES
                ForEach(LineMapModel.lines) { line in
                    LineMapComponent(
                        imageName: line.imageName,
                        geometryProxy: proxy,
                        positionMultiplier: line.positionMultiplier,
                        lineColor: mapVm.bindingLineColor(for: line.lineCase),
                        lineOpacity: mapVm.bindingLineOpacity(for: line.lineCase)
                    )
                    .animation(.default, value: mapVm.linesOpacity[line.lineCase])
                }
                
                // CONNECTORS
                ForEach(ConnectorMapModel.connectors) { connector in
                    ConnectorMapComponent(
                        imageName: connector.imageName,
                        geometryProxy: proxy,
                        positionMultiplier: connector.positionMultiplier,
                        rotation: connector.rotation
                    )
                }
            }
            .onAppear{self.mapSize = proxy.size}
        }
        .aspectRatio(contentMode: .fill)
        .modifier(ImageModifier(contentSize: $mapSize))
    }
}

struct FocusLineSheetPlaceholder: View {
    let opacityAction: (LineCase) -> Void
    
    @State var linesActives: [LineCase: Bool] = {
        var aux = [LineCase: Bool]()
        
        LineCase.allCases.forEach { line in
            aux[line] = false
        }
        
        return aux
    }()
    
    var body: some View {
        List(LineCase.allCases) { line in
            Button {
                opacityAction(line)
                linesActives[line]?.toggle()
            } label: {
                HStack {
                    Text(line.title)
                    Spacer()
                    if linesActives[line] ?? true {
                        Image(systemName: "playstation.logo")
                    }
                }
            }
        }
    }
    
    //        HStack {
    //            Picker(selection: $selectedLine) {
    //                ForEach(LineCase.allCases) { line in
    //                    Text(line.title)
    //                }
    //            } label: {
    //                Text("COLOR")
    //            }
    //
    //            ColorPicker("COR", selection: mapVm.bindingLineColor(for: selectedLine))
    //        }
            
    //        Button("oi") {
    //            showSheet.toggle()
    //        }
}
