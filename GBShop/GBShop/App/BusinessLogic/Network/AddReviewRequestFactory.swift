//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 30/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(userId: Int, text: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
}
