import SwiftUI
import Charts

struct PortfolioOverviewView: View {
    @StateObject private var viewModel = PortfolioViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Total Value: $\(viewModel.totalValue, specifier: "%.2f")")
                        .font(.headline)
                    
                    Chart(viewModel.assetValues) { assetValue in
                        BarMark(
                            x: .value("Asset", assetValue.asset.name),
                            y: .value("Value", assetValue.value)
                        )
                    }
                    .frame(height: 300)
                    .padding()
                    
                    // Add more charts and insights here
                }
            }
            .navigationTitle("Portfolio Overview")
        }
    }
}