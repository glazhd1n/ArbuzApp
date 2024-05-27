import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var viewModel: CartViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.cart.isEmpty {
                    Text("Ваша корзина пуста")
                        .font(.headline)
                        .padding()
                } else {
                    ScrollView {
                        ForEach(viewModel.cart.keys.sorted(by: {$0.name > $1.name} )) { product in
                            HStack {
                                Image(product.image)
                                    .resizable()
                                    .frame(width: 60, height: 70)
                                    .aspectRatio(contentMode: .fit)
                                Text(product.name)
                                Spacer()
                                HStack {
                                    Button(action: {
                                        viewModel.removeProductFromCart(product)
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(.red)
                                            .font(.title2)
                                    }
                                    .padding(.horizontal)
                                    Spacer()
                                    Text("\(viewModel.getQuantity(for: product))")
                                        .lineLimit(1)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Button(action: {
                                        viewModel.addProductToCart(product)
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(.green)
                                            .font(.title2)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding()

                    if viewModel.isEligibleForFreeShipping {
                        Text(viewModel.freeShippingMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    Text(String(format: "Итоговая стоимость: %.2f тг", viewModel.totalPrice))
                                        .font(.headline)
                                        .padding()
                                    
                    Button(action: {
                        viewModel.validateCart { message in
                            self.alertMessage = message
                            self.showAlert = true
                        }
                    }) {
                    Text("Завершить покупку")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                        }
                    .padding(.bottom)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Завершение покупки"),
                            message: Text(alertMessage),
                            dismissButton: .cancel(Text("OK")) {
                                self.viewModel.clearCart()
                            }
                        )
                    }

                }
                
            }
            .navigationTitle("Корзина")
        }
    }
}
