import Foundation
import Combine

class LedgerViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
        fetchTransactions()
    }
    
    func fetchTransactions() {
        dataManager.fetchTransactions()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle error if needed
            } receiveValue: { [weak self] transactions in
                self?.updateTransactions(transactions)
            }
            .store(in: &cancellables)
    }
    
    func addTransaction(_ transaction: Transaction) {
        dataManager.saveTransaction(transaction)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle error if needed
            } receiveValue: { [weak self] _ in
                self?.updateTransactions(self?.transactions ?? [] + [transaction])
            }
            .store(in: &cancellables)
    }
    
    func editTransaction(_ updatedTransaction: Transaction) {
        dataManager.saveTransaction(updatedTransaction)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle error if needed
            } receiveValue: { [weak self] _ in
                guard let self = self else { return }
                let updatedTransactions = self.transactions.map { $0.id == updatedTransaction.id ? updatedTransaction : $0 }
                self.updateTransactions(updatedTransactions)
            }
            .store(in: &cancellables)
    }
    
    private func updateTransactions(_ newTransactions: [Transaction]) {
        self.transactions = newTransactions.sorted(by: { $0.date < $1.date })
    }
}