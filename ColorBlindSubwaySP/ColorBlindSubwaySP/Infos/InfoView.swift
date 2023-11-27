//
//  InfoView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct InfoView: View {
//    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
//        NavigationView {
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
            
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Informações")
//                        .font(.custom("Purple Smile", size: 24))
//                        .foregroundColor(.black)
//                }
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        dismiss.callAsFunction()
//                    }, label: {
//                        Image(systemName: "chevron.left")
//                            .font(.system(size: 23, weight: .heavy))
//                            .foregroundColor(.blue)
//                    })
//                }
//            }
//        }
        .navigationTitle("Informações")
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
