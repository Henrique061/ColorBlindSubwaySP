//
//  ColorView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct ColorView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Cores")
                    .font(.system(size: 22).weight(.bold))
                Spacer()
                Button {
                    //ação de salvar
                } label: {
                    Text("Salvar")
                        .foregroundStyle(.white)
                        .background(
                            Capsule()
                                .fill(.black)
                                .frame(width: 80, height: 30)
                        )
                }
              
            }.padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), spacing: 8) {
                ForEach(CircleType.allCases, id: \.self) { type in
                    Button {
                        //chamar acao
                    } label: {
                        CircleComponent(circleType: type)
                    }
                    
                }
            }
            
        }.padding()
        Spacer()
    }
}

enum CircleType: CaseIterable {
    case azul, verde, vermelho, amarelo, lilas, rubi, diamante, esmeralda, turquesa, coral, safira, jade, prata
    
    var title: String {
        switch self {
        case .azul:
            return "1 - Azul"
        case .verde:
            return "2 - Verde"
        case .vermelho:
            return "3 - Vermelha"
        case .amarelo:
            return "4 - Amarela"
        case .lilas:
            return "5 - Lilás"
        case .rubi:
            return "7 - Rubi"
        case .diamante:
            return "8 - Diadema"
        case .esmeralda:
            return "9 - Esmeralda"
        case .turquesa:
            return "10 - Turquesa"
        case .coral:
            return "11 - Coral"
        case .safira:
            return "12 - Safira"
        case .jade:
            return "13 - Jade"
        case .prata:
            return "15 - Prata"
        }
    }
    
    var color: Color {
        switch self {
        case .azul:
            return Color("azul")
        case .verde:
            return Color("verde")
        case .vermelho:
            return Color("vermelha")
        case .amarelo:
            return Color("amarela")
        case .lilas:
            return Color("lilas")
        case .rubi:
            return Color("rubi")
        case .diamante:
            return Color("diamante")
        case .esmeralda:
            return Color("esmeralda")
        case .turquesa:
            return Color("turquesa")
        case .coral:
            return Color("coral")
        case .safira:
            return Color("safira")
        case .jade:
            return Color("jade")
        case .prata:
            return Color("prata")
        }
    }
}

#Preview {
    ColorView()
}

