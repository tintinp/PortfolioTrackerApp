import Foundation

struct Asset: Identifiable, Codable {
    let id: UUID
    let name: String
    let symbol: String
    var quantity: Int
    var purchasePrice: Double
}