//
//  AddToBasket.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Класс запроса на добавление товара в корзину
public class AddToBasket: AbstractRequestFactory {
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

// MARK: - реализация метода добавления товара в корзину
extension AddToBasket: AddToBasketRequestFactory {
    public func addToBasket(userId: Int, productId: Int, quantity: Int, completionHandler: @escaping(DataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, userId: userId, productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension AddToBasket {
    private struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket"
        
        let userId: Int
        let productId: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "id_product": productId,
                "quantity": quantity
            ]
        }
    }
}
