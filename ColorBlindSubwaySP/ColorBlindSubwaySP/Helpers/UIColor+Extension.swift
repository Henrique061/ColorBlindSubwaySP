//
//  UIColor+Extension.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 09/11/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Inspired by https://cocoacasts.com/from-hex-to-uicolor-and-back-in-swift
// Make Color codable. This includes support for transparency.
// See https://www.digitalocean.com/community/tutorials/css-hex-code-colors-alpha-values
extension Color: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hex = try container.decode(String.self)
        
        self.init(hex: hex)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(toHex)
    }
    
    var toHex: String? {
        return toHex()
      }
    
    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor?.components, components.count >= 3 else {
          return nil
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
          a = Float(components[3])
        }
        
        if alpha {
          return String(format: "%02lX%02lX%02lX%02lX",
                        lroundf(r * 255),
                        lroundf(g * 255),
                        lroundf(b * 255),
                        lroundf(a * 255))
        }
        else {
          return String(format: "%02lX%02lX%02lX",
                        lroundf(r * 255),
                        lroundf(g * 255),
                        lroundf(b * 255))
        }
      }
}
