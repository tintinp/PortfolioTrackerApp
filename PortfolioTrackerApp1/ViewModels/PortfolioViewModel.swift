import Foundation
import Combine

struct AssetValue: Identifiable {
    let id = UUID()
    let asset: Asset
    let value: Double
}

class PortfolioViewModel: ObservableObject {
    @Published var assetValues: [AssetValue] = []
    @Published var totalValue: Double = 0.0
    
    private var cancellables = Set<AnyCancellable>()
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
        fetchAssetValues()
    }
    
    private func fetchAssetValues() {
        dataManager.fetchAssets()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle error if needed
            } receiveValue: { [weak self] assets in
                self?.calculateAssetValues(assets)
            }
            .store(in: &cancellables)
    }
    
    private func calculateAssetValues(_ assets: [Asset]) {
        var newAssetValues: [AssetValue] = []
        var newTotalValue: Double = 0.0
        
        for asset in assets {
            let value = Double(asset.quantity) * asset.purchasePrice
            newAssetValues.append(AssetValue(asset: asset, value: value))
            newTotalValue += value
        }
        
        self.assetValues = newAssetValues
        self.totalValue = newTotalValue
    }
}