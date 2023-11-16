//
//  MapViewModel.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 16/11/23.
//

import Foundation
import SwiftUI

class MapViewModel : ObservableObject {
    //MARK: - VARS
    @Published var linesColors: [LineCase: Color] = {
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
    @Published var linesOpacity: [LineCase: Double] = {
        var aux = [LineCase: Double]()
        
        LineCase.allCases.forEach({ line in
            aux[line] = Double(1)
        })
        
        return aux
    }()
    @Published var focusedLines: Set<LineCase> = Set()
    
    //MARK: - BINDING GETTERS
    public func bindingLineColor(for key: LineCase) -> Binding<Color> {
        return .init(
            get: { self.linesColors[key, default: .black] },
            set: { self.linesColors[key] = $0 }
        )
    }
    
    public func bindingLineOpacity(for key: LineCase) -> Binding<Double> {
        return .init(
            get: { self.linesOpacity[key, default: 1] },
            set: { self.linesOpacity[key] = $0 }
        )
    }
    
    //MARK: - FUNCTIONS
    public func changeLineOpacity(line: LineCase) {
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
