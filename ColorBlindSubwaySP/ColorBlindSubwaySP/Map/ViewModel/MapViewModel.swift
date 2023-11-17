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
        
        aux[.azul_1]      = Color("azul")
        aux[.verde_2]     = Color("verde")
        aux[.vermelha_3]  = Color("vermelha")
        aux[.amarela_4]   = Color("amarela")
        aux[.lilas_5]     = Color("lilas")
        aux[.rubi_7]      = Color("rubi")
        aux[.diamante_8]  = Color("diamante")
        aux[.esmeralda_9] = Color("esmeralda")
        aux[.turquesa_10] = Color("turquesa")
        aux[.coral_11]    = Color("coral")
        aux[.safira_12]   = Color("safira")
        aux[.jade_13]     = Color("jade")
        aux[.prata_15]    = Color("prata")
        
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
