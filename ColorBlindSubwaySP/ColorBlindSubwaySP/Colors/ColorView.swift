//
//  ColorView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct ColorView: View {
    @Environment(\.screenSize) var screenSize
    @ObservedObject var mapVm: MapViewModel
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        VStack {
            HStack {
                Text("Cores")
                    .font(.system(size: screenSize.width * 0.056).weight(.bold))
                    .padding(.horizontal, isIPad ? screenSize.width * -0.040 : screenSize.width * 0.007)
                Spacer()
                Button {
                    //ação de salvar
                } label: {
                    Text("Salvar")
                        .foregroundStyle(.white)
                        .font(.system(size: screenSize.width * 0.038))
                        .background(
                            Capsule()
                                .fill(.black)
                                .frame(width: screenSize.width * 0.203, height: screenSize.height * 0.039)
                        )
                }
            }
            .padding(.horizontal, isIPad ? screenSize.width * 0.073 : screenSize.width * 0.025)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 3), count: 4), spacing: 3) {
                ForEach(LineCase.allCases, id: \.self) { type in
                    CircleComponent(
                        mapVm: mapVm,
                        circleType: type
                    )
                }
            }
            
        }
        .padding()
        Spacer()
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(mapViewModel: mapVM)
//    }
//}
