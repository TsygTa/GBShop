//
//  UserDefaults.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
class UserDefaults {
    
    private init() {}
    
    internal static let instance = UserDefaults()
    
    internal var user: User?
}
