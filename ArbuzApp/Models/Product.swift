import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let name: String
    let price: Double
    let minQuantity: Int
    var isLiked: Bool = false
}
