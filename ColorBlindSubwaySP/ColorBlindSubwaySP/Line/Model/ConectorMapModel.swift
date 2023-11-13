//
//  ConectorMapModel.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 10/11/23.
//

import Foundation

struct ConnectorMapModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var connectedLines: Set<LineCase>
    var imageName: String
    var positionMultiplier: CGPoint
    var rotation: CGFloat
    
    public init(id: UUID = UUID(), connectedLines: Set<LineCase>, imageName: String = "ConectorDuplo", positionMultiplier: CGPoint, rotation: CGFloat = 0) {
        self.id = id
        self.connectedLines = connectedLines
        self.imageName = imageName
        self.positionMultiplier = positionMultiplier
        self.rotation = rotation
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ConnectorMapModel, rhs: ConnectorMapModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}


extension ConnectorMapModel {
    public static var connectors: [ConnectorMapModel] = [
        // QUADRUPLOS
        ConnectorMapModel(connectedLines: Set([.coral_11, .turquesa_10, .rubi_7, .azul_1, .amarela_4]), imageName: "ConectorLuz",    positionMultiplier: .init(x: 0.502,  y: 0.340)),  // luz
        ConnectorMapModel(connectedLines: Set([.safira_12, .coral_11, .turquesa_10, .vermelha_3]),      imageName: "ConectorBras",   positionMultiplier: .init(x: 0.629,  y: 0.3995)), // bras
        
        // TRIPLOS
        ConnectorMapModel(connectedLines: Set([.rubi_7, .diamante_8, .vermelha_3]),  imageName: "ConectorTriplo", positionMultiplier: .init(x: 0.342,  y: 0.349)), // palmeiras - barra funda
        ConnectorMapModel(connectedLines: Set([.safira_12, .coral_11, .vermelha_3]), imageName: "ConectorTriplo", positionMultiplier: .init(x: 0.755,  y: 0.392)), // tatuape
        
        // DUPLOS
        ConnectorMapModel(connectedLines: Set([.azul_1, .lilas_5]),         positionMultiplier: .init(x: 0.511,  y: 0.860), rotation: 90),  // santa cruz
        ConnectorMapModel(connectedLines: Set([.esmeralda_9, .lilas_5]),    positionMultiplier: .init(x: 0.073,  y: 0.974), rotation: 135), // santo amaro
        ConnectorMapModel(connectedLines: Set([.verde_2, .lilas_5]),        positionMultiplier: .init(x: 0.582,  y: 0.804), rotation: 45),  // chacara kablin
        ConnectorMapModel(connectedLines: Set([.verde_2, .azul_1]),         positionMultiplier: .init(x: 0.494,  y: 0.774), rotation: 90),  // ana rosa
        ConnectorMapModel(connectedLines: Set([.verde_2, .azul_1]),         positionMultiplier: .init(x: 0.494,  y: 0.735), rotation: 90),  // paraiso
        ConnectorMapModel(connectedLines: Set([.verde_2, .prata_15]),       positionMultiplier: .init(x: 0.883,  y: 0.606), rotation: 0),   // vila prudente
        ConnectorMapModel(connectedLines: Set([.verde_2, .turquesa_10]),    positionMultiplier: .init(x: 0.863,  y: 0.646), rotation: 90),  // tamanduatei
        ConnectorMapModel(connectedLines: Set([.esmeralda_9, .amarela_4]),  positionMultiplier: .init(x: 0.080,  y: 0.590), rotation: 0),   // pinheiros
        ConnectorMapModel(connectedLines: Set([.esmeralda_9, .diamante_8]), positionMultiplier: .init(x: 0.057,  y: 0.385), rotation: 0),   // pres. altino
        ConnectorMapModel(connectedLines: Set([.esmeralda_9, .diamante_8]), positionMultiplier: .init(x: 0.023,  y: 0.385), rotation: 0),   // osasco
        ConnectorMapModel(connectedLines: Set([.verde_2, .amarela_4]),      positionMultiplier: .init(x: 0.309,  y: 0.568), rotation: 90),  // paulista/consolacao
        ConnectorMapModel(connectedLines: Set([.vermelha_3, .amarela_4]),   positionMultiplier: .init(x: 0.412,  y: 0.447), rotation: 0),   // republica
        ConnectorMapModel(connectedLines: Set([.vermelha_3, .azul_1]),      positionMultiplier: .init(x: 0.5025, y: 0.459), rotation: 0),   // se
        ConnectorMapModel(connectedLines: Set([.safira_12, .jade_13]),      positionMultiplier: .init(x: 0.818,  y: 0.310), rotation: 135), // eng goulart
        ConnectorMapModel(connectedLines: Set([.safira_12, .coral_11]),     positionMultiplier: .init(x: 1.222,  y: 0.319), rotation: 0),   // calmon viana
        ConnectorMapModel(connectedLines: Set([.coral_11, .vermelha_3]),    positionMultiplier: .init(x: 1.010,  y: 0.4005), rotation: 0)  // corinthians - itaquera
    ]
}
