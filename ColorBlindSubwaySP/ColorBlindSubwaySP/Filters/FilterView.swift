//
//  FilterView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            Text("Filtros")
                .font(.system(size: 22).weight(.bold))
//                .frame(alignment: .leading)
            Spacer()
                .frame(height: 20)
            
            HStack{
                FilterComponent(filterColor: Color("deuteranopia"), filterName: "Deuteranopia")
                FilterComponent(filterColor: Color("protanopia"), filterName: "Protanopia")
                FilterComponent(filterColor: Color("tritanopia"), filterName: "Tritanopia")
                FilterComponent(filterColor: Color("acromatopsia"), filterName: "Acromatopsia")
            }
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
