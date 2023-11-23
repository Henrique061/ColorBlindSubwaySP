//
//  DeuteranopiaFilter.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 16/11/23.
//

import Foundation
import SwiftUI

class StandardFilters {
    
    public static var originalColors: [LineCase: Color] = {
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
    
    public static var deuteranopia: [LineCase: Color] = {
        var aux = [LineCase: Color]()
        
        aux[.azul_1]      = Color(hex: "00539F")
        aux[.verde_2]     = Color(hex: "0C0700")
        aux[.vermelha_3]  = Color(hex: "E6308A")
        aux[.amarela_4]   = Color(hex: "EFCC1E")
        aux[.lilas_5]     = Color(hex: "FFA1D4")
        aux[.rubi_7]      = Color(hex: "B0926A")
        aux[.diamante_8]  = Color(hex: "F4BF96")
        aux[.esmeralda_9] = Color(hex: "80B3FF")
        aux[.turquesa_10] = Color(hex: "9ADAC3")
        aux[.coral_11]    = Color(hex: "774706")
        aux[.safira_12]   = Color(hex: "187AF1")
        aux[.jade_13]     = Color(hex: "AA8B61")
        aux[.prata_15]    = Color(hex: "4E81C0")
        
        return aux
    }()
    
    public static var protanopia: [LineCase: Color] = {
        var aux = [LineCase: Color]()
        
        aux[.azul_1]      = Color(hex: "00539F")
        aux[.verde_2]     = Color(hex: "0C0700")
        aux[.vermelha_3]  = Color(hex: "87A38D")
        aux[.amarela_4]   = Color(hex: "EFCC1E")
        aux[.lilas_5]     = Color(hex: "A48696")
        aux[.rubi_7]      = Color(hex: "E5A248")
        aux[.diamante_8]  = Color(hex: "80B3FF")
        aux[.esmeralda_9] = Color(hex: "F4BF96")
        aux[.turquesa_10] = Color(hex: "9ADAC3")
        aux[.coral_11]    = Color(hex: "774706")
        aux[.safira_12]   = Color(hex: "187AF1")
        aux[.jade_13]     = Color(hex: "AA8B61")
        aux[.prata_15]    = Color(hex: "4E81C0")
        
        return aux
    }()
    
    public static var tritanopia: [LineCase: Color] = {
        var aux = [LineCase: Color]()
        
        aux[.azul_1]      = Color(hex: "00539F")
        aux[.verde_2]     = Color(hex: "0C0700")
        aux[.vermelha_3]  = Color(hex: "E6308A")
        aux[.amarela_4]   = Color(hex: "AA8B61")
        aux[.lilas_5]     = Color(hex: "9F9FC2")
        aux[.rubi_7]      = Color(hex: "E5A248")
        aux[.diamante_8]  = Color(hex: "FF7E1A")
        aux[.esmeralda_9] = Color(hex: "3A3994")
        aux[.turquesa_10] = Color(hex: "774706")
        aux[.coral_11]    = Color(hex: "9ADAC3")
        aux[.safira_12]   = Color(hex: "187AF1")
        aux[.jade_13]     = Color(hex: "66E1B5")
        aux[.prata_15]    = Color(hex: "759CCD")
        
        return aux
    }()
    
    public static var acromatopsia: [LineCase: Color] = {
        var aux = [LineCase: Color]()
        
        aux[.azul_1]      = Color(hex: "9F9F9F")
        aux[.verde_2]     = Color(hex: "000000")
        aux[.vermelha_3]  = Color(hex: "3C3C3C")
        aux[.amarela_4]   = Color(hex: "AA8B61")
        aux[.lilas_5]     = Color(hex: "696969")
        aux[.rubi_7]      = Color(hex: "535353")
        aux[.diamante_8]  = Color(hex: "FF7E1A")
        aux[.esmeralda_9] = Color(hex: "3A3994")
        aux[.turquesa_10] = Color(hex: "8F8F8F")
        aux[.coral_11]    = Color(hex: "9ADAC3")
        aux[.safira_12]   = Color(hex: "818FB4")
        aux[.jade_13]     = Color(hex: "202020")
        aux[.prata_15]    = Color(hex: "606060")
        
        return aux
    }()
}
