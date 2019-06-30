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
    let id_user: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_comment"
        case id_user = "id_user"
        case text = "text"
    }
}
