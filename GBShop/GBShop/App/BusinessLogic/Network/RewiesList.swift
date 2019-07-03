//
//  RewiesList.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class ReviewsList: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string:"http://0.0.0.0:8080/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ReviewsList: ReviewsListRequestFactory {
    func getReviewsList(page: Int, completionHandler: @escaping(DataResponse<ReviewsListResult>) -> Void) {
        let requestModel = ReviewsList(baseUrl: baseUrl, page: page)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewsList {
    struct ReviewsList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviewsList"
        
        let page: Int
        var parameters: Parameters? {
            return [
                "page_number": page
            ]
        }
    }
}
