//
//  ColorView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 07/11/23.
//

import SwiftUI

struct ColorView: View {
    @StateObject var mapVm: MapViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Cores")
                    .font(.system(size: 22).weight(.bold))
                Spacer()
                Button {
                    //ação de salvar
                } label: {
                    Text("Salvar")
                        .foregroundStyle(.white)
                        .background(
                            Capsule()
                                .fill(.black)
                                .frame(width: 80, height: 30)
                        )
                }
              
            }.padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), spacing: 8) {
                ForEach(LineCase.allCases, id: \.self) { type in
                    CircleComponent(
                        mapVm: mapVm,
                        circleType: type
                    )
                    
                }
            }
            
        }.padding()
        Spacer()
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(mapViewModel: mapVM)
//    }
//}
