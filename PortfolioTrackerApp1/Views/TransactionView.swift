import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.type.rawValue.capitalized)
                    .font(.headline)
                if let asset = transaction.asset {
                    Text(asset.name)
                        .font(.subheadline)
                }
                Text(transaction.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(formattedAmount)
                    .font(.headline)
                    .foregroundColor(transaction.type == .withdraw || transaction.type == .sell ? .red : .green)
                if let notes = transaction.notes {
                    Text(notes)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: transaction.amount)) ?? "$0.00"
    }
}