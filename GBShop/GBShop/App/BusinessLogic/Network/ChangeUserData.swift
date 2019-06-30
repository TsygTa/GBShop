//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string:"http://0.0.0.0:8080/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeData(userName: String, password: String, userData: UserData, completionHandler: @escaping(DataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, login: userName, password: password, userData: userData)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
        
        let login: String
        let password: String
        let userData: UserData
        var parameters: Parameters? {
            return [
                "id_user" : userData.id,
                "username" : login,
                "password" : password,
                "email" : userData.email,
                "gender": userData.gender.hashValue,
                "credit_card" : userData.creditCard,
                "bio" : userData.bio
            ]
        }
    }
}
