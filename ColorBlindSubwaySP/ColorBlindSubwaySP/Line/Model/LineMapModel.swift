//
//  LineMapModel.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 09/11/23.
//

import Foundation
import SwiftUI

enum LineCase: CaseIterable, Codable, Hashable, Identifiable {
    public var id: Self { self }
    
    case azul_1, verde_2, vermelha_3, amarela_4, lilas_5, rubi_7, diamante_8, esmeralda_9, turquesa_10, coral_11, safira_12, jade_13, prata_15
    
    var title: String {
        switch self {
        case .azul_1:
            return "1 - Azul"
        case .verde_2:
            return "2 - Verde"
        case .vermelha_3:
            return "3 - Vermelha"
        case .amarela_4:
            return "4 - Amarela"
        case .lilas_5:
            return "5 - Lilás"
        case .rubi_7:
            return "7 - Rubi"
        case .diamante_8:
            return "8 - Diadema"
        case .esmeralda_9:
            return "9 - Esmeralda"
        case .turquesa_10:
            return "10 - Turquesa"
        case .coral_11:
            return "11 - Coral"
        case .safira_12:
            return "12 - Safira"
        case .jade_13:
            return "13 - Jade"
        case .prata_15:
            return "15 - Prata"
        }
    }
    
    var color: Color {
        switch self {
        case .azul_1:
            return Color("azul")
        case .verde_2:
            return Color("verde")
        case .vermelha_3:
            return Color("vermelha")
        case .amarela_4:
            return Color("amarela")
        case .lilas_5:
            return Color("lilas")
        case .rubi_7:
            return Color("rubi")
        case .diamante_8:
            return Color("diamante")
        case .esmeralda_9:
            return Color("esmeralda")
        case .turquesa_10:
            return Color("turquesa")
        case .coral_11:
            return Color("coral")
        case .safira_12:
            return Color("safira")
        case .jade_13:
            return Color("jade")
        case .prata_15:
            return Color("prata")
        }
    }
}

struct LineMapModel : Codable, Hashable, Identifiable {
    var id = UUID()
    let lineCase: LineCase
    let imageName: String
    let positionMultiplier: CGPoint
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lineCase)
    }
    
    public static func == (lhs: LineMapModel, rhs: LineMapModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

extension LineMapModel {
    public static var lines: [LineMapModel] = [
        LineMapModel(lineCase: .azul_1,      imageName: "LinhaAzul",      positionMultiplier:  .init(x: 0.595,  y: 0.500)),
        LineMapModel(lineCase: .esmeralda_9, imageName: "LinhaEsmeralda", positionMultiplier:  .init(x: 0.020,  y: 0.822)),
        LineMapModel(lineCase: .amarela_4,   imageName: "LinhaAmarela",   positionMultiplier:  .init(x: 0.115,  y: 0.545)),
        LineMapModel(lineCase: .lilas_5,     imageName: "LinhaLilas",     positionMultiplier:  .init(x: 0.186,  y: 0.937)),
        LineMapModel(lineCase: .verde_2,     imageName: "LinhaVerde",     positionMultiplier:  .init(x: 0.497,  y: 0.627)),
        LineMapModel(lineCase: .vermelha_3,  imageName: "LinhaVermelha",  positionMultiplier:  .init(x: 0.700,  y: 0.450)),
        LineMapModel(lineCase: .rubi_7,      imageName: "LinhaRubi",      positionMultiplier:  .init(x: 0.138,  y: 0.075)),
        LineMapModel(lineCase: .diamante_8,  imageName: "LinhaDiamante",  positionMultiplier: .init(x: -0.016,  y: 0.347)),
        LineMapModel(lineCase: .turquesa_10, imageName: "LinhaTurquesa",  positionMultiplier:  .init(x: 0.9325, y: 0.673)),
        LineMapModel(lineCase: .coral_11,    imageName: "LinhaCoral",     positionMultiplier:  .init(x: 0.994,  y: 0.404)),
        LineMapModel(lineCase: .safira_12,   imageName: "LinhaSafira",    positionMultiplier:  .init(x: 0.985,  y: 0.2425)),
        LineMapModel(lineCase: .jade_13,     imageName: "LinhaJade",      positionMultiplier:  .init(x: 1.045,  y: 0.050)),
        LineMapModel(lineCase: .prata_15,    imageName: "LinhaPrata",     positionMultiplier:  .init(x: 1.125,  y: 0.555))
    ]
}
