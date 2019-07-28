//
//  ProductDataResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

public struct ProductDataResult: Codable {
    let result: Int
    let product: Product
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case product = "product"
        case errorMessage = "errorMessage"
    }
}
