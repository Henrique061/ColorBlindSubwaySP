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
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
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
            }.padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)

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
            }.padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
        }
        .padding(.horizontal, isIPad ? screenSize.width * 0.073 : screenSize.width * 0.025)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
