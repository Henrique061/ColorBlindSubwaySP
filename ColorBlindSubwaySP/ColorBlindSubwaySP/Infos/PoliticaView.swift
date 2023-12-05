//
//  PoliticaView.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 10/11/23.
//

import SwiftUI

struct PoliticaView: View {
    var body: some View {
        VStack {
            Text("""
            Não serão coletados dados sensíveis de nossos usuários. Não compartilhamos dados pessoais com terceiros. Apesar disso, é possível que o façamos para cumprir alguma determinação legal ou regulatória, ou ainda, para cumprir alguma ordem expedida por autoridade pública. Quaisquer tipos de dados que por ventura precisem ser coletados só serão coletados desde que sejam fornecidos com o consentimento do usuário. Conforme Lei de Proteção de Dados Pessoais, a coleta de dados e as atividades de tratamento delas decorrentes serão informadas aos usuários do aplicativo.
            """)
//                        .multilineTextAlignment(.leading)
            .padding(20)
            Spacer()
     
        }.navigationTitle("Política de Privacidade")
        
    }
}

struct PoliticaView_Previews: PreviewProvider {
    static var previews: some View {
        PoliticaView()
    }
}
