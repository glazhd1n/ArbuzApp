//
//  CartItem.swift
//  ArbuzApp
//
//  Created by Сабир Глаждин on 20.05.2024.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int

    var totalPrice: Double {
        return Double(quantity) * product.price
    }
}
