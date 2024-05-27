import Combine

class ProductViewModel: ObservableObject {
    private var productService: ProductService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var products: [Product] = []
    
    init(productService: ProductService) {
        self.productService = productService
        observeProducts()
    }
    
    private func observeProducts() {
        productService.productRepository.$products
            .assign(to: \.products, on: self)
            .store(in: &cancellables)
    }
    
    func getRepository() -> ProductRepository {
        return productService.productRepository
    }
}
