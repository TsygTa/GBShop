//
//  PaymentRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Протокол запроса на оплату товара
public protocol PaymentRequestFactory {
    /// Оплата товара
    ///     userId - id пользователя
    /// Возвращает: результат запроса
    func payment(userId: Int, completionHandler: @escaping (DataResponse<PaymentResult>) -> Void)
}
