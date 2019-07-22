//
//  Basket.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 18/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
public struct Basket: Codable {
    let id: Int
    let userId: Int
    var products: [Product]
    var total: Int {
        var sum = 0
        for product in products {
            sum += product.price * product.quantity
        }
        return sum
    }
    var isPaid: Bool
}
