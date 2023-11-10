//
//  LineMapModel.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 09/11/23.
//

import Foundation

public enum LineCase : String, CaseIterable, Codable, Hashable, Identifiable {
    public var id: Self { self }
    
    case azul_1      = "Linha 1 - Azul"
    case verde_2     = "Linha 2 - Verde"
    case vermelha_3  = "Linha 3 - Vermelha"
    case amarela_4   = "Linha 4 - Amarela"
    case lilas_5     = "Linha 5 - Lilas"
    case rubi_7      = "Linha 7 - Rubi"
    case diamante_8  = "Linha 8 - Diamante"
    case esmeralda_9 = "Linha 9 - Esmeralda"
    case turquesa_10 = "Linha 10 - Turquesa"
    case coral_11    = "Linha 11 - Coral"
    case safira_12   = "Linha 12 - Safira"
    case jade_13     = "Linha 13 - Jade"
    case prata_15    = "Linha 15 - Prata"
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
        LineMapModel(lineCase: .azul_1,      imageName: "LinhaAzul",      positionMultiplier: .init(x: 0.575, y: 0.500)),
        LineMapModel(lineCase: .amarela_4,   imageName: "LinhaAmarela",   positionMultiplier: .init(x: 0.186, y: 0.545)),
        LineMapModel(lineCase: .verde_2,     imageName: "LinhaVerde",     positionMultiplier: .init(x: 0.490, y: 0.616)),
        LineMapModel(lineCase: .vermelha_3,  imageName: "LinhaVermelha",  positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .lilas_5,     imageName: "LinhaLilas",     positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .rubi_7,      imageName: "LinhaRubi",      positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .diamante_8,  imageName: "LinhaDiamante",  positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .esmeralda_9, imageName: "LinhaEsmeralda", positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .turquesa_10, imageName: "LinhaTurquesa",  positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .coral_11,    imageName: "LinhaCoral",     positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .safira_12,   imageName: "LinhaSafira",    positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .jade_13,     imageName: "LinhaJade",      positionMultiplier: .init(x: 0.662, y: 0.462)),
//        LineMapModel(lineCase: .prata_15,    imageName: "LinhaPrata",     positionMultiplier: .init(x: 0.662, y: 0.462))
    ]
}
