//
//  RemoveReviewResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

public struct RemoveReviewResult: Codable {
    let result: Int
    let errorMessage: String?
}
