//
//  RequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeProductsListRequestFactory() -> ProductsListRequestFactory {
        let errorParser = makeErrorParser()
        return ProductsList(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeProductDataRequestFactory() -> ProductDataRequestFactory {
        let errorParser = makeErrorParser()
        return ProductData(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeReviewsListRequestFactory() -> ReviewsListRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewsList(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
}
