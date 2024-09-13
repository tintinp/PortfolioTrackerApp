//
//  ContentView.swift
//  PortfolioTrackerApp1
//
//  Created by Tin-tin Patana-anake on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Swapped the order of these two TabItems
            LedgerView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Ledger")
                }
            PortfolioOverviewView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Portfolio")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
