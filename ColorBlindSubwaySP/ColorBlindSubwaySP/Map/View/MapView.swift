//
//  MapView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct MapView: View {
    @State var mapLines: [LineCase: Color] = {
        var aux = [LineCase: Color]()
        
        aux[.azul_1]      = Color(hex: "00539F")
        aux[.verde_2]     = Color(hex: "008061")
        aux[.vermelha_3]  = Color(hex: "EF4135")
        aux[.amarela_4]   = Color(hex: "FFD400")
        aux[.lilas_5]     = Color(hex: "784E9F")
        aux[.rubi_7]      = Color(hex: "A01866")
        aux[.diamante_8]  = Color(hex: "9E9F95")
        aux[.esmeralda_9] = Color(hex: "00A88E")
        aux[.turquesa_10] = Color(hex: "007C8F")
        aux[.coral_11]    = Color(hex: "F04E22")
        aux[.safira_12]   = Color(hex: "033F88")
        aux[.jade_13]     = Color(hex: "00AC5B")
        aux[.prata_15]    = Color(hex: "9E9F95")
        
        return aux
    }()
    
    @State var selectedLine: LineCase = .azul_1
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(LineMapModel.lines) { line in
                    LineMapComponent(
                        imageName: line.imageName,
                        geometryProxy: proxy,
                        positionMultiplier: line.positionMultiplier,
                        lineColor: bindingMapLine(for: line.lineCase)
                    )
                }
                
//                Image("LinhaAzul")
//                    .resizable()
//                    .scaledToFill()
//                    .scaleEffect(0.3)
//                    .colorMultiply(.blue)
//                    .position(x: proxy.size.width * 0.8225, y: proxy.size.height * 0.5)
//                    .rotationEffect(.degrees(90))
//                    .zIndex(-1)
                
                Image("ConectorLuz")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(0.015)
                    .position(x: proxy.size.width * 0.4975, y: proxy.size.height * 0.37)
            }
        }
        .aspectRatio(contentMode: .fill)
        
        HStack {
            Picker("Line", selection: $selectedLine) {
                ForEach(LineCase.allCases) { lineCase in
                    Text(lineCase.rawValue)
                }
            }
            ColorPicker("", selection: bindingMapLine(for: selectedLine))
        }
    }
    
    private func bindingMapLine(for key: LineCase) -> Binding<Color> {
        return .init(
            get: { self.mapLines[key, default: .black] },
            set: { self.mapLines[key] = $0 }
        )
    }
}
