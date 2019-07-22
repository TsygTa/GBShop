//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

public struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
}
