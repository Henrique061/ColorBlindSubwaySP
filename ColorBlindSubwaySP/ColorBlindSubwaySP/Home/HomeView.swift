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
                    .modifier(ImageModifier(contentSize: CGSize(width: geo.size.width, height: geo.size.height)))
                
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
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "camera.filters")
                                    Text("Filtros")
                                }
                                
                            }
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "scribble.variable")
                                    Text("Cores")
                                }
                                
                            }
                            Button {
                                //chamar a sheet
                            } label: {
                                VStack {
                                    Image(systemName: "tram.circle.fill")
                                    Text("Rotas")
                                }
                                
                            }
                            
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

#Preview {
    HomeView()
}

