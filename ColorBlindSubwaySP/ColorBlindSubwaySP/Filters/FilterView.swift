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
    
//    var setFilter: ([LineCase:Color])->Void
    var mapViewModel : MapViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Filtros")
                .font(.system(size: screenSize.width * 0.056).weight(.bold))
                .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
            
            HStack(spacing: 45){
                Button(action: {
                    mapViewModel.setFilter(filter: StandardFilters.originalColors)
                }, label: {
                    FilterComponent(
                        filterColor: Color("original"),
                        filterName: "Sem filtro",
                        hasBorder: StandardFilters.originalColors == mapViewModel.linesColors)
                })
                Button(action: {
                    mapViewModel.setFilter(filter: StandardFilters.deuteranopia)
                }, label: {
                    FilterComponent(
                        filterColor: Color("deuteranopia"),
                        filterName: "Deuteranopia",
                        hasBorder: StandardFilters.deuteranopia == mapViewModel.linesColors)
                })
                Button(action: {
                    mapViewModel.setFilter(filter: StandardFilters.protanopia)
                }, label: {
                    FilterComponent(
                        filterColor: Color("protanopia"),
                        filterName: "Protanopia",
                        hasBorder: StandardFilters.protanopia == mapViewModel.linesColors)
                })
            }
            .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)

            HStack(spacing: 45){
                Button(action: {
                    mapViewModel.setFilter(filter: StandardFilters.tritanopia)
                }, label: {
                    FilterComponent(
                        filterColor: Color("tritanopia"),
                        filterName: "Tritanopia",
                        hasBorder: StandardFilters.tritanopia == mapViewModel.linesColors)
                })
                Button(action: {
                    mapViewModel.setFilter(filter: StandardFilters.acromatopsia)
                }, label: {
                    FilterComponent(
                        filterColor: Color("acromatopsia"),
                        filterName: "Acromatopsia",
                        hasBorder: StandardFilters.deuteranopia == mapViewModel.linesColors)
                })
                
                if UserDefaults.standard.object(forKey: UserDefaultsPresets.presetPersonalizadoKey) != nil {
                    Button(action: {
                        mapViewModel.setFilter(filter: UserDefaultsPresets.recuperarPresetSalvo(key: UserDefaultsPresets.presetPersonalizadoKey))
                    }, label: {
                        FilterComponent(
                            filterColor: Color("meuFiltro"),
                            filterName: "Meu filtro",
                            hasBorder: StandardFilters.deuteranopia == mapViewModel.linesColors)
                    })
                }
            }
            .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
        }
        .padding(.horizontal, isIPad ? screenSize.width * 0.073 : screenSize.width * 0.025)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
