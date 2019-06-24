//
//  Product.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
