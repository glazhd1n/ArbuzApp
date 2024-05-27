import SwiftUI

struct FavoriteScreen: View {
    @EnvironmentObject var productRepository: ProductRepository
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(productRepository.products.filter { $0.isLiked }) { product in
                        ProductCard(product: product)
                            .environmentObject(viewModel)
                            .environmentObject(productRepository)
                    }
                }
            }
            .navigationTitle("Избранное")
        }
    }
}
