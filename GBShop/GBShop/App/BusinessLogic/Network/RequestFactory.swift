//
//  RequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

public class RequestFactory {
    internal func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    private lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    private let sessionQueue = DispatchQueue.global(qos: .utility)
    /// Формирует запрос на авторизацию пользователя
    internal func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на регистрацию пользователя
    internal func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на изменение данных пользователя
    internal func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    /// Формирует запрос на выход
    internal func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на получение списка товаров
    internal func makeProductsListRequestFactory() -> ProductsListRequestFactory {
        let errorParser = makeErrorParser()
        return ProductsList(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на получение информации о товаре
    internal func makeProductDataRequestFactory() -> ProductDataRequestFactory {
        let errorParser = makeErrorParser()
        return ProductData(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на получение списка отзывов о товаре
    internal func makeReviewsListRequestFactory() -> ReviewsListRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewsList(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на добавление отзыва о товаре
    internal func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на удаление отзыва о товаре
    internal func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на добавление товара в корзину
    internal func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    /// Формирует запрос на удаление товара из корзины
    internal func makeDeleteFromBasketRequestFactory() -> DeleteFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromBasket(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    /// Формирует запрос на оплату товара
    internal func makePaymentRequestFactory() -> PaymentRequestFactory {
        let errorParser = makeErrorParser()
        return Payment(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
}
