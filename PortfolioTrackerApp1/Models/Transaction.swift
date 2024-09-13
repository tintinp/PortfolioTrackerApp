import Foundation

enum TransactionType: String, Codable, CaseIterable {
    case withdraw
    case deposit
    case buy
    case sell
    case dividend
}

struct Transaction: Identifiable, Codable {
    let id: UUID
    var type: TransactionType
    var asset: Asset?
    var amount: Double
    var date: Date
    var notes: String?
}