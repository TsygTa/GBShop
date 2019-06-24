//
//  ProductsListRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductsListRequestFactory {
    func getProductsList(page: Int, categoryId: Int, completionHandler: @escaping (DataResponse<[Product]>) -> Void)
}
