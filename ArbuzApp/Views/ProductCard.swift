import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var viewModel: ProductViewModel
    let product: Product
    @State private var isLiked = false

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                isLiked.toggle()
                            }) {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(isLiked ? .red : .gray)
                                    .padding()
                            }
                        }
                    }
                )

            Text(product.name)
                .font(.headline)
                .padding(.top, 10)

            HStack {
                Text("\(product.price, specifier: "%.2f") ₸ за единицу")
                Spacer()
            }.padding([.leading, .trailing], 10)

            Button(action: {
                viewModel.addToCart(product: product)
            }) {
                Text("Добавить в корзину - \(product.price, specifier: "%.2f") ₸")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding([.leading, .trailing, .bottom], 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}
