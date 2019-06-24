//
//  UserData.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 20/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

enum Gender: String {
    case male = "m"
    case female = "f"
}

struct UserData {
    let id: Int
    var email: String
    var gender: Gender
    var creditCard: String
    var bio: String
}
