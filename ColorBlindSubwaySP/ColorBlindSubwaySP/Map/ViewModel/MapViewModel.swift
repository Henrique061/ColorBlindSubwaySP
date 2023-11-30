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
    @Published var linesColors: [LineCase: Color]
    @Published var linesOpacity: [LineCase: Double] = {
        var aux = [LineCase: Double]()
        
        LineCase.allCases.forEach({ line in
            aux[line] = Double(1)
        })
        
        return aux
    }()
    @Published var focusedLines: Set<LineCase> = Set()
    
    init() {
        let presetSalvo = UserDefaultsPresets().recuperarPresetSalvo(key: UserDefaultsPresets.pressetSalvoKey)
        self.linesColors = presetSalvo
    }
    
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
    
    public func setFilter(filter: [LineCase: Color]){
        linesColors = filter
        UserDefaultsPresets().salvarPresetEscolhido(linesColors: linesColors, key: UserDefaultsPresets.pressetSalvoKey)
    }
    
    public func clearAllFocused() {
        focusedLines.removeAll()
        setAllLinesOpacity(to: 1)
    }
    
    private func setAllLinesOpacity(to value: Double) {
        LineCase.allCases.forEach { line in
            linesOpacity[line] = value
        }
    }
}
