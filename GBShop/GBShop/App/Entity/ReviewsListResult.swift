//
//  ReviewsListResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

public struct ReviewsListResult: Codable {
    let page: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case page
        case reviews
    }
}
