//
//  DireitosView.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 10/11/23.
//

import SwiftUI

struct DireitosView: View {
    var body: some View {
        Text("©2023Metrozin. Todos os direitos reservados a seus criadores: Caroline, Henrique, Luana.")
        .multilineTextAlignment(.leading)
        .padding(20)
    }
}

struct DireitosView_Previews: PreviewProvider {
    static var previews: some View {
        DireitosView()
    }
}
