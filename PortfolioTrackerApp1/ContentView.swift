//
//  ContentView.swift
//  PortfolioTrackerApp1
//
//  Created by Tin-tin Patana-anake on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Press Me") {
                print("Debug: Button was pressed!")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
