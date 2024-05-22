//import SwiftUI
//
//struct ProductCard: View {
//    @EnvironmentObject var viewModel: ProductViewModel
//    let product: Product
//    @State private var isLiked = false
//
//    var body: some View {
//        VStack {
//            Image(product.image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 200)
//                .cornerRadius(10)
//                .overlay(
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                isLiked.toggle()
//                            }) {
//                                Image(systemName: isLiked ? "heart.fill" : "heart")
//                                    .foregroundColor(isLiked ? .red : .gray)
//                                    .padding()
//                            }
//                        }
//                    }
//                )
//
//            Text(product.name)
//                .font(.headline)
//                .padding(.top, 10)
//
//            HStack {
//                Text("\(product.price, specifier: "%.2f") ₸ за единицу")
//                Spacer()
//            }.padding([.leading, .trailing], 10)
//
//            Button(action: {
//                viewModel.addToCart(product: product)
//            }) {
//                Text("\(product.price, specifier: "%.2f") ₸")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(5)
//            }
//            .padding([.leading, .trailing, .bottom], 10)
//        }
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//        .padding()
//    }
//}


import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var viewModel: ProductViewModel
    var product: Product

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(height: 100)
                .cornerRadius(10)
            VStack {
                
                HStack {
                    Text(product.name)
                        .font(.headline)
                        .lineLimit(2)
                    Spacer()
                    Button(action: {
                        product.isLiked.toggle()
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
                Spacer()
                Button(action: {
                    viewModel.addToCart(product: product)
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                        .font(.title2)
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.1)) // Серый фон для всей HStack
            .cornerRadius(25)
        }
        .padding()
    }
}
