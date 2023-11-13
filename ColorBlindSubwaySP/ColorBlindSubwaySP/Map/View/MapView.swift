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
    
    // - MARK: BODY
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // LINES
                ForEach(LineMapModel.lines) { line in
                    LineMapComponent(
                        imageName: line.imageName,
                        geometryProxy: proxy,
                        positionMultiplier: line.positionMultiplier,
                        lineColor: bindingMapLine(for: line.lineCase)
                    )
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
        }
        .background(Color(.gray))
        .aspectRatio(contentMode: .fill)
    }
    
    
    //- MARK: FUNCTIONS
    private func bindingMapLine(for key: LineCase) -> Binding<Color> {
        return .init(
            get: { self.mapLines[key, default: .black] },
            set: { self.mapLines[key] = $0 }
        )
    }
}
