//
//  SignUp.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
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

extension SignUp: SignUpRequestFactory {
    func signUp(userName: String, password: String, userData: UserData, completionHandler: @escaping(DataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUp(baseUrl: baseUrl, login: userName, password: password, userData: userData)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct SignUp: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "registerUser"
        
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
