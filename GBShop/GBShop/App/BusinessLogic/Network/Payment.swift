//
//  Payment.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 03/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Класс запроса на оплату товара
public class Payment: AbstractRequestFactory {
    internal let errorParser: AbstractErrorParser
    internal let sessionManager: SessionManager
    internal let queue: DispatchQueue?
    private let baseUrl = URL(string:"http://0.0.0.0:8080/")!
    
    internal init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - реализация метода оплаты товара
extension Payment: PaymentRequestFactory {
    public func payment(userId: Int, completionHandler: @escaping(DataResponse<PaymentResult>) -> Void) {
        let requestModel = Payment(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension Payment {
    private struct Payment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "payment"
        
        let userId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}
