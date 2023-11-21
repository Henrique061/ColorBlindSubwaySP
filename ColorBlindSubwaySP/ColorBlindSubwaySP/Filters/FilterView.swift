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
                Button(action: {
                    
                }, label: {
                    FilterComponent(filterColor: Color("deuteranopia"), filterName: "Deuteranopia")
                })
                Button(action: {
                    
                }, label: {
                    FilterComponent(filterColor: Color("protanopia"), filterName: "Protanopia")
                })
                Button(action: {
                    
                }, label: {
                    FilterComponent(filterColor: Color("tritanopia"), filterName: "Tritanopia")
                })
                Button(action: {
                    
                }, label: {
                    FilterComponent(filterColor: Color("acromatopsia"), filterName: "Acromatopsia")
                })
                
                
                
                
            }
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
