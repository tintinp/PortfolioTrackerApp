import Foundation
import Combine

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func fetchAssets() -> AnyPublisher<[Asset], Error> {
        // Implement fetching assets from local storage
        // For now, we'll return dummy data
        let assets = [
            Asset(id: UUID(), name: "Apple", symbol: "AAPL", quantity: 10, purchasePrice: 150.0),
            Asset(id: UUID(), name: "Microsoft", symbol: "MSFT", quantity: 5, purchasePrice: 200.0)
        ]
        return Just(assets)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func saveTransaction(_ transaction: Transaction) -> AnyPublisher<Void, Error> {
        // Implement saving transaction to local storage
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchTransactions() -> AnyPublisher<[Transaction], Error> {
        // Implement fetching transactions from local storage
        // For now, we'll return dummy data
        let transactions = [
            Transaction(id: UUID(), type: .buy, asset: Asset(id: UUID(), name: "Apple", symbol: "AAPL", quantity: 5, purchasePrice: 150.0), amount: 750.0, date: Date(), notes: nil),
            Transaction(id: UUID(), type: .sell, asset: Asset(id: UUID(), name: "Microsoft", symbol: "MSFT", quantity: 2, purchasePrice: 300.0), amount: 600.0, date: Date(), notes: nil)
        ]
        return Just(transactions)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteTransaction(_ transaction: Transaction) -> AnyPublisher<Void, Error> {
        // Implement deleting transaction from local storage
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}