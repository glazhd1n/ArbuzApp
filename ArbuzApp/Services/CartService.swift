import Foundation

class CartService {
    var cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func getCart() -> [Product: Int] {
        return cartRepository.cart
    }
    
    func addProductToCart(_ product: Product) {
        cartRepository.addProductToCart(product)
    }
    
    func clearCart() {
        cartRepository.cart.removeAll()
    }
}
