//
//  InfoView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
            VStack {
                NavigationButton(image: "person", text: "Sobre", link: SobreView())
                Spacer()
                    .frame(height: 20)
                NavigationButton(image: "lock", text: "Política de Privacidade", link: PoliticaView())
                Spacer()
                    .frame(height: 20)
                NavigationButton(image: "c.circle", text: "Direitos Autorais", link: DireitosView())
                Spacer()
            }
            .padding(20)
            .padding(.top, 30)
        .navigationTitle("Informações")
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
