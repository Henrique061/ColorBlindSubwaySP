//
//  HomeView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 06/11/23.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                Image("linha-prata")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    //.modifier(ImageModifier(contentSize: CGSize(width: geo.size.width, height: geo.size.height)))
                
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button {
                                //que acao??
                            } label: {
                                VStack {
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                }
                            }
                            Spacer()
                                .frame(width: 5)
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "camera.filters")
                                    Text("Filtros")
                                }
                            }
                            Spacer()
                                .frame(width: 5)
                            
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "scribble.variable")
                                    Text("Cores")
                                }
                            }
                            Spacer()
                                .frame(width: 5)
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "tram.circle.fill")
                                    Text("Rotas")
                                }
                            }
                            Spacer()
                                .frame(width: 5)
                            NavigationLink {
                                InfoView()
                            } label: {
                                VStack {
                                    Image(systemName: "info.circle")
                                    Text("Infos")
                                }
                            }
                        }
                    }
            }
        } .accentColor(.black)
    }
}

//#Preview {
//    HomeView()
//}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
