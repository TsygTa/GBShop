//
//  LoginResult.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 16/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

public struct LoginResult: Codable {
    let result: Int
    let user: User?
    let errorMessage: String?
}
