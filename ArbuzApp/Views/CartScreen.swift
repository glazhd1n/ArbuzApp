import SwiftUI

struct CartScreen: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.cartItems.isEmpty {
                    Text("Ваша корзина пуста")
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.cartItems) { item in
                            HStack {
                                Text(item.product.name)
                                Spacer()
                                Text("\(item.quantity) x \(item.product.price, specifier: "%.2f") ₸")
                            }
                        }
                    }

                    Text("Итоговая сумма: \(viewModel.totalPrice, specifier: "%.2f") ₸")
                        .font(.headline)
                        .padding()

                    if viewModel.totalPrice < 8000 {
                        Text("Добавьте еще \(8000 - viewModel.totalPrice, specifier: "%.2f") ₸ для бесплатной доставки")
                            .foregroundColor(.red)
                            .padding()
                    }

                    Button(action: {
                        validateCart()
                    }) {
                        Text("Оформить заказ")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .navigationTitle("Корзина")
        }
    }

    private func validateCart() {
        viewModel.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.isLoading = false
            print("Hello World!")
        }
    }
}
