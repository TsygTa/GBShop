//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeData(userName: String, password: String, userData: UserData, completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void)
}
