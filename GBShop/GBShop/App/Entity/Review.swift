//
//  Review.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

struct Review: Codable {
    let id: Int
    let userId: Int?
    let productId: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case productId
        case text
    }
}
