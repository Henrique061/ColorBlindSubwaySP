//
//  DireitosView.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 10/11/23.
//

import SwiftUI

struct DireitosView: View {
    var body: some View {
        VStack {
            Text("""
            ©2023MeuMetrô. Todos os direitos reservados a seus criadores: Caroline Stelitano, Henrique Assis, Luana Moraes.
            Mapa das linhas de metrô, direitos reservados a Metrô SP: www.metro.sp.gov.br
            """)
            .multilineTextAlignment(.leading)
            .padding(20)
            Spacer()
        }.navigationTitle("Direitos Autorais")
        
    }
}

struct DireitosView_Previews: PreviewProvider {
    static var previews: some View {
        DireitosView()
    }
}
