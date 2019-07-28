//
//  DeleteFromBasketResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Структура ответа на запрос удаления товара из корзины
public struct DeleteFromBasketResult: Codable {
    let result: Int
    let errorMessage: String?
}
