//
//  FilterView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.screenSize) var screenSize
    
    var setFilter: ([LineCase:Color])->Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Filtros")
                .font(.system(size: 22).weight(.bold))
            
            HStack(spacing: 50){
                Button(action: {
                    setFilter(StandardFilters.originalColors)
                }, label: {
                    FilterComponent(filterColor: Color("original"), filterName: "Sem filtro")
                })
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
            }.frame(width: screenSize.width * 0.9, alignment: .leading)

            HStack(spacing: 50){
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
            }.frame(width: screenSize.width * 0.9, alignment: .leading)
            
        }.frame(width: screenSize.width * 0.9, height: screenSize.height * 0.5, alignment: .topLeading)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
