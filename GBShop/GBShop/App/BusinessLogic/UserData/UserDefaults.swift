//
//  UserDefaults.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

public class UserDefaults {
    private init() {}
    
    static let instance = UserDefaults()
    var user: User?
}
