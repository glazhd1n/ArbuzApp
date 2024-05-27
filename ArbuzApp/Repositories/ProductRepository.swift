import Combine

class ProductRepository: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        self.products = [
                    Product(image: "chicken", name: "Куриное Филе", price: 1000.0, minQuantity: 1),
                    Product(image: "pepper", name: "Перец", price: 2000.0, minQuantity: 1),
                    Product(image: "alex", name: "Минеральная вода", price: 2000.0, minQuantity: 1),
                    Product(image: "cucumbers", name: "Огурцы", price: 2000.0, minQuantity: 1),
                    Product(image: "kotleti", name: "Котлеты", price: 2000.0, minQuantity: 1),
                    Product(image: "natakhtari", name: "Натахтари", price: 2000.0, minQuantity: 1),
                    Product(image: "oil", name: "Масло", price: 2000.0, minQuantity: 1),
                    Product(image: "sparzha", name: "Спаржа", price: 2000.0, minQuantity: 1),
                    Product(image: "steak", name: "Стэйк", price: 2000.0, minQuantity: 1),
                    Product(image: "asu", name: "Вода ASU", price: 2000.0, minQuantity: 1),
                ]
    }
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func toggleFavorite(for product: Product) {
           if let index = products.firstIndex(where: { $0.id == product.id }) {
               products[index].isLiked.toggle()
           }
    }
}
