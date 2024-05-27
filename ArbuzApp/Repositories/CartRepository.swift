import Combine

class CartRepository: ObservableObject {
    @Published var cart = [Product: Int]()
    
    func addProductToCart(_ product: Product) {
        if let quantity = cart[product] {
            cart[product] = quantity + 1
        } else {
            cart[product] = 1
        }
    }
    
    func removeProductFromCart(_ product: Product) {
        if let quantity = cart[product], quantity > 1 {
            cart[product] = quantity - 1
        } else {
            cart[product] = nil
        }
    }
    
    func getQuantity(for product: Product) -> Int {
        return cart[product] ?? 0
    }
    
    func getTotalPrice() -> Double {
        return cart.reduce(0) { $0 + ($1.key.price * Double($1.value)) }
    }

}
