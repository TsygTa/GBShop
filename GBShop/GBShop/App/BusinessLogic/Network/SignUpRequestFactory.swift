//
//  SignUpRequestFactory.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func signUp(userName: String, password: String, userData: UserData, completionHandler: @escaping (DataResponse<SignUpResult>) -> Void)
}
