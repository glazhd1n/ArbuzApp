import Combine
import Foundation

class CartViewModel: ObservableObject {
    private var cartService: CartService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var cart: [Product: Int] = [:]
    
    var freeShippingThreshold: Double = 8000.0
    
    var freeShippingMessage: String {
        let difference = freeShippingThreshold - totalPrice
        return String(format: "Добавьте товаров на %.2f тг для бесплатной доставки.", difference)
    }
    
    var isEligibleForFreeShipping: Bool {
        totalPrice < freeShippingThreshold
    }
    
    init(cartService: CartService) {
        self.cartService = cartService
        observeCart()
    }
    
    private func observeCart() {
        cartService.cartRepository.$cart
            .assign(to: \.cart, on: self)
            .store(in: &cancellables)
    }
    
    func addProductToCart(_ product: Product) {
        cartService.addProductToCart(product)
    }
    
    func removeProductFromCart(_ product: Product) {
        cartService.cartRepository.removeProductFromCart(product)
    }
    
    func validateCart(completion: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion("Ваш заказ успешно принят!")
        }
    }
    
    func getQuantity(for product: Product) -> Int {
        return cartService.cartRepository.getQuantity(for: product)
    }
    
    func clearCart() {
        cartService.cartRepository.cart.removeAll()
    }
    
    var totalPrice: Double {
        cartService.cartRepository.getTotalPrice()
    }
}
