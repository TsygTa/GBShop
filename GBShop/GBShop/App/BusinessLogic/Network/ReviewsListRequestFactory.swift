//
//  ReviewsListRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewsListRequestFactory {
    func getReviewsList(page: Int, completionHandler: @escaping (DataResponse<ReviewsListResult>) -> Void)
}
