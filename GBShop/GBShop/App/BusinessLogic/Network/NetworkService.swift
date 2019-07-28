//
//  NetworkService.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 08/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

class NetworkService {
    
    private init() {}
    
    internal static let instance = NetworkService()
    
    internal var requestFactory = RequestFactory()

}
