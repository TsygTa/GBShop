//
//  ProductDataRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 24/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductDataRequestFactory {
    func getProductData(productId: Int, completionHandler: @escaping (DataResponse<ProductDataResult>) -> Void)
}
