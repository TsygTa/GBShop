//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Протокол запроса на удаление продукта из корзины
public protocol DeleteFromBasketRequestFactory {
    /// Удаление товара из корзины
    ///     productId - id товара
    /// Возвращает: результат запроса
    func deleteFromBasket(productId: Int, completionHandler: @escaping (DataResponse<DeleteFromBasketResult>) -> Void)
}
