import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var viewModel: CartViewModel
    @EnvironmentObject var productRepository: ProductRepository
    @State var product: Product

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            VStack {
                
                HStack {
                    Text(product.name)
                        .font(.headline)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        productRepository.toggleFavorite(for: product)
                    }) {
                        Image(systemName: product.isLiked ? "heart.fill" : "heart")
                            .foregroundColor(product.isLiked ? .red : .gray)
                    }
                }
                
                
                HStack {
                    Text("\(product.price, specifier: "%.2f") ₸")
                        .font(.footnote)
                        .foregroundColor(Color.gray.opacity(0.6))
                    Spacer()
                    Text("1 шт")
                        .font(.footnote)
                        .foregroundColor(Color.green.opacity(0.8))
                }
            }

            HStack {
                if(viewModel.getQuantity(for: product) == 0) {
                    Spacer()
                    Button(action: {
                        viewModel.addProductToCart(product)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .font(.title2)
                    }
                    .padding(.horizontal)
                } else {
                    Button(action: {
                        viewModel.removeProductFromCart(product)
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Text("\(viewModel.getQuantity(for: product))")
                        .lineLimit(1)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        viewModel.addProductToCart(product)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 5)
            .background(viewModel.getQuantity(for: product) == 0 ? Color.gray.opacity(0.1) : Color.green)
            .cornerRadius(25)
        }
        .padding()
        .onAppear {
            self.product = productRepository.products.first(where: { $0.id == product.id }) ?? product
        }
        .onReceive(productRepository.objectWillChange) { _ in
            self.product = productRepository.products.first(where: { $0.id == product.id }) ?? product
        }
    }
}
