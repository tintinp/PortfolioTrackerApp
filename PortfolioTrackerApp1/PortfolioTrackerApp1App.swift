//
//  PortfolioTrackerApp1App.swift
//  PortfolioTrackerApp1
//
//  Created by Tin-tin Patana-anake on 9/13/24.
//

import SwiftUI

@main
struct PortfolioTrackerApp1App: App {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
