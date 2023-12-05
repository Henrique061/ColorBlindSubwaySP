//
//  HomeView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 06/11/23.
//

import SwiftUI


struct HomeView: View {
    
    @Environment(\.screenSize) var screenSize
    @StateObject var mapViewModel = MapViewModel()
    @State private var showingColorSheet  = false
    @State private var showingFilterSheet = false
    @State private var showingFocusSheet  = false
    @State var mapSize: CGSize = .zero
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                MapView(mapVm: mapViewModel)
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            HStack(spacing: 70) {
                                Button {
                                    showingFilterSheet.toggle()
                                } label: {
                                    VStack {
                                        Image(systemName: "camera.filters")
                                        Text("Filtros")
                                    }.sheet(isPresented: $showingFilterSheet, content: {
                                        FilterView(setFilter: mapViewModel.setFilter)
                                            .presentationDetents([.medium, .large])
                                    })
                                }
                                Button {
                                    showingColorSheet.toggle()
                                } label: {
                                    VStack {
                                        Image(systemName: "scribble.variable")
                                        Text("Cores")
                                    }
                                }.sheet(isPresented: $showingColorSheet, content: {
                                    ColorView(mapVm: mapViewModel)
                                        .presentationDetents([.medium, .large])
                                        .presentationDetents([.fraction(0.75)])
                                })
                                Button {
                                    showingFocusSheet.toggle()
                                } label: {
                                    VStack {
                                        Image(systemName: "binoculars")
                                        Text("Foco")
                                    }
                                }.sheet(isPresented: $showingFocusSheet) {
                                    FocusView(mapVm: mapViewModel)
                                        .presentationDetents([.medium, .large])
                                        .presentationDetents([.fraction(0.75)])
                                }
                            }
                        }
                        ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                            NavigationLink {
                                InfoView()
                            } label: {
                                Image(systemName: "info.circle")
                            }
                        }
                    }
                    .navigationBarBackground()
            }
        }
    }
    
}
extension View {
    func navigationBarBackground(_ background: Color = .gray) -> some View {
        return self
            .modifier(ColoredNavigationBar(background: background))
    }
}

struct ColoredNavigationBar: ViewModifier {
    var background: Color
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(
                background,
                for: .bottomBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
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
