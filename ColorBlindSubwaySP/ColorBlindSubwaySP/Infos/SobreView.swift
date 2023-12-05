//
//  SobreView.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 09/11/23.
//

import SwiftUI

struct SobreView: View {
    var body: some View {
        VStack {
            Text("""
            Este app foi desenvolvido de forma a auxiliar pessoas daltônicas e pessoas de baixa visão, através das cores, a visualizar o mapa do metrô de São Paulo - SP.
            """)
            .multilineTextAlignment(.leading)
        .padding(20)
        Spacer()
        }.navigationTitle("Sobre")
        
    }
}

struct SobreView_Previews: PreviewProvider {
    static var previews: some View {
        SobreView()
    }
}
