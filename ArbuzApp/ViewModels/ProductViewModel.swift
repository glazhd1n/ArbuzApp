import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var isLoading: Bool = false

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        // Замените этот мок-объект реальными данными из запроса
        products = [
            Product(image: "chicken", name: "Product 1", price: 1000.0, minQuantity: 1),
            Product(image: "chicken", name: "Product 2", price: 2000.0, minQuantity: 1)
        ]
    }

    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += product.minQuantity
        } else {
            let newItem = CartItem(product: product, quantity: product.minQuantity)
            cartItems.append(newItem)
        }
    }

    func updateQuantity(for item: CartItem, by amount: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += amount
            if cartItems[index].quantity <= 0 {
                cartItems.remove(at: index)
            }
        }
    }

    var totalPrice: Double {
        return cartItems.reduce(0) { $0 + $1.totalPrice }
    }
}
