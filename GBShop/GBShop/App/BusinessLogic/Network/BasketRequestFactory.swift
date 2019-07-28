//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 18/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Протокол запроса на получение списка товаров корзины пользователя
public protocol BasketRequestFactory {
    /// Получение списка товаров корзины
    ///     userId - id пользователя
    /// Возвращает: результат запроса
    func getBasket(userId: Int, completionHandler: @escaping (DataResponse<Basket>) -> Void)
}
