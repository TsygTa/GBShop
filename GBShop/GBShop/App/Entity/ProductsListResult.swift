//
//  ProductsListResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

struct ProductsListResult: Codable {
    let page_number: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case page_number
        case products
    }
}

