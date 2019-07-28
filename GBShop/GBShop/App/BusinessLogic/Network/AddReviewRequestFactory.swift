//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Протокол запроса на добавление отзыва
protocol AddReviewRequestFactory {
    /// Формирует запрос на добавление отзыва
    ///
    /// - Parameters:
    ///   - userId: id пользователя
    ///   - productId: id продукта
    ///   - text: текст отзыва
    ///   - completionHandler: обработчик ответа на запрос
    func addReview(userId: Int, productId: Int, text: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
}
