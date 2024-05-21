import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: ProductViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailScreen(productID: product.id)) {
                            ProductCard(product: product)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                    }

                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.products) { product in
                                ProductCard(product: product)
                                    .frame(width: 300)
                            }
                        }
                    }

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(viewModel.products) { product in
                            ProductCard(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Главная")
        }
    }
}
