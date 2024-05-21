import SwiftUI

struct ProductDetailScreen: View {
    @StateObject var viewModel = ProductViewModel()
    let productID: UUID

    var body: some View {
        VStack {
            if let product = viewModel.products.first(where: { $0.id == productID }) {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding()

                Text(product.name)
                    .font(.largeTitle)
                    .padding()

                Button(action: {
                    viewModel.addToCart(product: product)
                }) {
                    Text("Добавить в корзину - \(product.price, specifier: "%.2f") ₸")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            } else {
                Text("Загрузка...")
                    .onAppear(perform: fetchProductDetails)
            }
        }
        .navigationTitle("Детали товара")
    }

    private func fetchProductDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.products = [
                Product(image: "chicken", name: "Example Product", price: 1000.0, minQuantity: 1)
            ]
        }
    }
}
