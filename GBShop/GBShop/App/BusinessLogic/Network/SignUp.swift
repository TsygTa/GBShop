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
    let baseUrl = URL(string:"http://0.0.0.0:8081/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension SignUp: SignUpRequestFactory {
    func signUp(user: User, completionHandler: @escaping(DataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUp(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct SignUp: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "registerUser"
        
        let user: User
        var parameters: Parameters? {
            return [
                "id" : user.id,
                "login" : user.login,
                "password" : user.password,
                "name" : user.name,
                "lastname": user.lastname,
                "email" : user.email,
                "gender": user.gender.hashValue,
                "creditCard" : user.creditCard,
                "bio" : user.bio
            ]
        }
    }
}
