//
//  RemoveReview.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class RemoveReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string:"http://0.0.0.0:8081/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension RemoveReview: RemoveReviewRequestFactory {
    func removeReview(reviewId: Int, completionHandler: @escaping(DataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl,reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReview {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview"
        
        let reviewId: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": reviewId
            ]
        }
    }
}
