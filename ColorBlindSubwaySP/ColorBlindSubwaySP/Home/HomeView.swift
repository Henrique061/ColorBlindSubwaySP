//
//  HomeView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 06/11/23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var mapViewModel = MapViewModel()
    @State private var showingSheet = false
    @State private var showingSheetFilter = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                MapView(mapVm: mapViewModel)
//                InfoView()
                
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button {
                                showingSheetFilter.toggle()
                            } label: {
                                VStack {
                                    Image(systemName: "camera.filters")
                                    Text("Filtros")
                                }.sheet(isPresented: $showingSheetFilter, content: {
                                    FilterView()
                                        .presentationDetents([.medium, .large])
                                })
                            }
                            Spacer()
                                .frame(width: 5)
                            
                            Button {
                                showingSheet.toggle()
                            } label: {
                                VStack {
                                    Image(systemName: "scribble.variable")
                                    Text("Cores")
                                }
                            }.sheet(isPresented: $showingSheet, content: {
                                ColorView(mapVm: mapViewModel)
                                    .presentationDetents([.medium, .large])
                            })
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
        } 
    }
}

//#Preview {
//    HomeView()
//}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
