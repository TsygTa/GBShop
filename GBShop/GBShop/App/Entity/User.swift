//
//  User.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 19/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation


enum Gender: String {
    case male = "m"
    case female = "f"
}

public struct User: Codable {
    var id: Int = 0
    var login: String = ""
    var password: String = ""
    var email: String = ""
    var name: String = ""
    var lastname: String = ""
    var gender: String = "m"
    var creditCard: String = ""
    var bio: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case login = "login"
        case password = "password"
        case email = "email"
        case name = "name"
        case lastname = "lastname"
        case gender = "gender"
        case creditCard = "creditCard"
        case bio = "bio"
    }
}
