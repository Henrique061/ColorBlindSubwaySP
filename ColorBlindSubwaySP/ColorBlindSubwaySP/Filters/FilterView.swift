//
//  FilterView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct FilterView: View {
    var setFilter: ([LineCase:Color])->Void
    
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
                    setFilter(StandardFilters.deuteranopia)
                }, label: {
                    FilterComponent(filterColor: Color("deuteranopia"), filterName: "Deuteranopia")
                })
                Button(action: {
                    setFilter(StandardFilters.protanopia)
                }, label: {
                    FilterComponent(filterColor: Color("protanopia"), filterName: "Protanopia")
                })
                Button(action: {
                    setFilter(StandardFilters.tritanopia)
                }, label: {
                    FilterComponent(filterColor: Color("tritanopia"), filterName: "Tritanopia")
                })
                Button(action: {
                    setFilter(StandardFilters.acromatopsia)
                }, label: {
                    FilterComponent(filterColor: Color("acromatopsia"), filterName: "Acromatopsia")
                })
            }
            Button(action: {
                setFilter(StandardFilters.originalColors)
            }, label: {
                FilterComponent(filterColor: Color("original"), filterName: "Sem filtro")
            })
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
