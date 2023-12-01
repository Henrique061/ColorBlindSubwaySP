//
//  FilterView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.screenSize) var screenSize
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
    var setFilter: ([LineCase:Color])->Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Filtros")
                .font(.system(size: screenSize.width * 0.056).weight(.bold))
                .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
            
            HStack(spacing: 45){
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
            }
//            .frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)

            HStack(spacing: 45){
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
                
                if UserDefaults.standard.object(forKey: UserDefaultsPresets.presetPersonalizadoKey) != nil {
                    Button(action: {
                        setFilter(UserDefaultsPresets.recuperarPresetSalvo(key: UserDefaultsPresets.presetPersonalizadoKey))
                    }, label: {
                        FilterComponent(filterColor: Color("meuFiltro"), filterName: "Meu filtro")
                    })
                }
            }
            //.frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
        }
//        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.5, alignment: .topLeading)
        .padding(.horizontal, isIPad ? screenSize.width * 0.073 : screenSize.width * 0.025)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
