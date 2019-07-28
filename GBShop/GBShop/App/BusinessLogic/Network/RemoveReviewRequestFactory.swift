//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(reviewId: Int, completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void)
}
