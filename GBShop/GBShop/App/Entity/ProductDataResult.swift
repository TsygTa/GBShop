//
//  ProductDataResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

struct ProductDataResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
