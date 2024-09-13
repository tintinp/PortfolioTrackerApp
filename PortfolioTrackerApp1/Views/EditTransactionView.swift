import SwiftUI

struct EditTransactionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: LedgerViewModel
    @State private var transaction: Transaction
    
    init(transaction: Transaction, viewModel: LedgerViewModel) {
        self._transaction = State(initialValue: transaction)
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Type", selection: $transaction.type) {
                    ForEach(TransactionType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                
                TextField("Amount", value: $transaction.amount, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                
                DatePicker("Date", selection: $transaction.date, displayedComponents: .date)
                
                TextField("Notes", text: Binding(
                    get: { self.transaction.notes ?? "" },
                    set: { self.transaction.notes = $0.isEmpty ? nil : $0 }
                ))
            }
            .navigationTitle("Edit Transaction")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    viewModel.editTransaction(transaction)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
