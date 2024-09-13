import SwiftUI

struct LedgerView: View {
    @StateObject private var viewModel = LedgerViewModel()
    @State private var selectedTransaction: Transaction?
    @State private var showingAddTransactionSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionView(transaction: transaction)
                        .onTapGesture {
                            selectedTransaction = transaction
                        }
                }
            }
            .navigationTitle("Ledger")
            .toolbar {
                Button("Add Transaction") {
                    showingAddTransactionSheet = true
                }
            }
            .sheet(item: $selectedTransaction) { transaction in
                EditTransactionView(transaction: transaction, viewModel: viewModel)
            }
        }
    }
}
