//
//  PaymentResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Структура ответа на запрос оплаты товара
public struct PaymentResult: Codable {
    let result: Int
    let userMessage: String
}
