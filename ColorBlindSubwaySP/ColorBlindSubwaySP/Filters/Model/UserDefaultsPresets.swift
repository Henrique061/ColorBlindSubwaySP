//
//  UserDefaultsPresets.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 28/11/23.
//

import Foundation
import SwiftUI

public class UserDefaultsPresets: ObservableObject {
    private static let userDefaults = UserDefaults.standard
    public static let presetSalvoKey = "presetSalvo"
    public static let presetPersonalizadoKey = "presetPersonalizado"
    
    public static func salvarPresetEscolhido(linesColors : [LineCase:Color], key: String) {
        if let encodedData = try? JSONEncoder().encode(linesColors) {
            userDefaults.set(encodedData, forKey: key)
        }
    }
    
    public static func recuperarPresetSalvo(key: String) -> [LineCase:Color] {
        if let savedFilter = userDefaults.object(forKey: key) as? Data {
            if let loadedFilter = try? JSONDecoder().decode([LineCase:Color].self, from: savedFilter) {

                return loadedFilter
            }
        }
        
        print("erro ao tentar loadar o filtro no UserDefaults")
        return StandardFilters.originalColors
    }
}




