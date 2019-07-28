//
//  Product.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

public struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    let description: String
    var quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
        case description = "description"
        case quantity = "quantity"
    }
}
