import Foundation

class ProductService {
    var productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func getAllProducts() -> [Product] {
        return productRepository.products
    }
    
}
