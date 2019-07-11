//
//  AddToBasketResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire
/// Структура ответа на запрос добавления товара в корзину
public struct AddToBasketResult: Codable {
    private let result: Int
}
