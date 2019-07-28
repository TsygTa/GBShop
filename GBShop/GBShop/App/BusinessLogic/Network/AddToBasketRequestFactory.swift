//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Протокол запроса на добавление продукта в корзину
public protocol AddToBasketRequestFactory {
    /// Добавление товара в корзину
    ///     productId - id товара
    ///     quantity - количество товара
    /// Возвращает: результат запроса
    func addToBasket(userId: Int, productId: Int,  quantity: Int, completionHandler: @escaping (DataResponse<AddToBasketResult>) -> Void)
}
