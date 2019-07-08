//
//  ReviewsListResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

struct ReviewsListResult: Codable {
    let page_number: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case page_number
        case reviews
    }
}
