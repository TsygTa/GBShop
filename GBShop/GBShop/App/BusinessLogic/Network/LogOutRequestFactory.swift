//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(userId: Int, completionHandler: @escaping (DataResponse<LogOutResult>) -> Void)
}
