//
//  ProductsList.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class ProductsList: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductsList: ProductsListRequestFactory {
    func getProductsList(page: Int, categoryId: Int, completionHandler: @escaping(DataResponse<[Product]>) -> Void) {
        let requestModel = ProductsList(baseUrl: baseUrl, page: page, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductsList {
    struct ProductsList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let page: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": page,
                "id_category": categoryId
            ]
        }
    }
}
