//
//  ConectorMapModel.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 10/11/23.
//

import Foundation

struct ConnectorMapModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var imageName: String
    var positionMultiplier: CGPoint
    var rotation: CGFloat
    
    public init(id: UUID = UUID(), imageName: String, positionMultiplier: CGPoint, rotation: CGFloat = 0) {
        self.id = id
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
        ConnectorMapModel(imageName: "ConectorLuz",    positionMultiplier: .init(x: 0.502,  y: 0.340)), // luz === (coral, turquesa, rubi, azul e amarela)
        ConnectorMapModel(imageName: "ConectorBras",   positionMultiplier: .init(x: 0.629,  y: 0.3995)), // bras === (safira, coral, turquesa e vermelha)
        ConnectorMapModel(imageName: "ConectorTriplo", positionMultiplier: .init(x: 0.342,  y: 0.349)), // palmeiras - barra funda === (rubi, diamante e vermelha)
        ConnectorMapModel(imageName: "ConectorTriplo", positionMultiplier: .init(x: 0.755,  y: 0.392)), // tatuape === (safira, coral e vermelha)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.511,  y: 0.860), rotation: 90), // santa cruz === (azul e lilas)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.073,  y: 0.974), rotation: 135), // santo amaro === (esmeralda e lilas)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.582,  y: 0.804), rotation: 45), // chacara kablin === (verde e lilas)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.494,  y: 0.774), rotation: 90), // ana rosa === (verde e azul)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.494,  y: 0.735), rotation: 90), // paraiso === (verde e azul)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.883,  y: 0.606), rotation: 0), // vila prudente === (verde e prata)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.863,  y: 0.646), rotation: 90), // tamanduatei === (verde e turquesa)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.080,  y: 0.590), rotation: 0), // pinheiros === (esmeralda e amarela)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.057,  y: 0.385), rotation: 0), // pres. altino === (esmeralda e diamante)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.023,  y: 0.385), rotation: 0), // osasco === (esmeralda e diamante)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.309,  y: 0.568), rotation: 90), // paulista/consolacao === (verde e amarela)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.412,  y: 0.447), rotation: 0), // republica === (vermelha e amarela)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.5025, y: 0.459), rotation: 0), // se === (vermelha e azul)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 0.818,  y: 0.310), rotation: 135), // eng goulart === (safira e jade)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 1.222,  y: 0.319), rotation: 0), // calmon viana === (safira e coral)
        ConnectorMapModel(imageName: "ConectorDuplo",  positionMultiplier: .init(x: 1.010,  y: 0.4005), rotation: 0), // corinthians - itaquera === (coral e vermelha)
    ]
}
