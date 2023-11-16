//
//  MapView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct MapView: View {
    @State var linesColors: [LineCase: Color] = {
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
    @State var linesOpacity: [LineCase: Double] = {
        var aux = [LineCase: Double]()
        
        LineCase.allCases.forEach({ line in
            aux[line] = Double(1)
        })
        
        return aux
    }()
    @State var focusedLines: Set<LineCase> = Set()
    
    @State var selectedLine: LineCase = .azul_1
    @State var showFocusLineSheet: Bool = false
    
    @State var mapSize: CGSize = .init(width: 400, height: 400)
    
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
                        lineColor: bindingLineColor(for: line.lineCase),
                        lineOpacity: bindingLineOpacity(for: line.lineCase)
                    )
                    .animation(.default, value: linesOpacity[line.lineCase])
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
        .sheet(isPresented: $showFocusLineSheet,
               content: {
            FocusLineSheetPlaceholder(opacityAction: changeLineOpacity)
        })
        .modifier(ImageModifier(contentSize: $mapSize))
        
//        Button {
//            showFocusLineSheet.toggle()
//        } label: {
//            Text("Opacity Sheet")
//        }
    }
    
    //MARK: - BINDING GETTERS
    private func bindingLineColor(for key: LineCase) -> Binding<Color> {
        return .init(
            get: { self.linesColors[key, default: .black] },
            set: { self.linesColors[key] = $0 }
        )
    }
    
    private func bindingLineOpacity(for key: LineCase) -> Binding<Double> {
        return .init(
            get: { self.linesOpacity[key, default: 1] },
            set: { self.linesOpacity[key] = $0 }
        )
    }
    
    //MARK: - FUNCTIONS
    private func changeLineOpacity(line: LineCase) {
        // remove linha que estava em foco
        if focusedLines.contains(line) {
            focusedLines.remove(line)
            linesOpacity[line] = 0
            
            // se nao tem mais nenhuma linha em foco, deixa todas com opacidade normal
            if focusedLines.isEmpty { setAllLinesOpacity(to: 1) }
        }
        
        // adiciona nova linha em foco
        else {
            // se nao tinha nenhuma linha em foco, deixa todas com opacidade em 0
            if focusedLines.isEmpty { setAllLinesOpacity(to: 0) }
            
            focusedLines.insert(line)
            linesOpacity[line] = 1
        }
    }
    
    private func setAllLinesOpacity(to value: Double) {
        LineCase.allCases.forEach { line in
            linesOpacity[line] = value
        }
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
}
