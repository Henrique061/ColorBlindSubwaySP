//
//  ColorBlindSubwaySPApp.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 30/10/23.
//

import SwiftUI

@main
struct ColorBlindSubwaySPApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geo in
                MapView()
                    .environment(\.screenSize, geo.size)
            }
        }
    }
}

private struct ScreenSizeKey : EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}
