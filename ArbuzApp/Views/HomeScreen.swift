import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.products) { product in
                            ProductCard(product: product)
                                .environmentObject(cartViewModel)
                                .environmentObject(viewModel.getRepository())
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Главная")
        }
    }
}
