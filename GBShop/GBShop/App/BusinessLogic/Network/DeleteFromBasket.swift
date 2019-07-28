//
//  DeleteFromBasket.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Класс запроса на удаление товара из корзины
public class DeleteFromBasket: AbstractRequestFactory {
    public let errorParser: AbstractErrorParser
    public let sessionManager: SessionManager
    public let queue: DispatchQueue?
    private let baseUrl = URL(string:"http://0.0.0.0:8081/")!
    
    internal init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - реализация метода удаления товара из корзины
extension DeleteFromBasket: DeleteFromBasketRequestFactory {
    public func deleteFromBasket(userId: Int, productId: Int, completionHandler: @escaping(DataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, userId: userId, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - Структура параметров запроса
extension DeleteFromBasket {
    private struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket"
        
        let userId: Int
        let productId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "id_product": productId
            ]
        }
    }
}
