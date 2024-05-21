import Foundation

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let price: Double
    let minQuantity: Int
}
