//
//  AbstractErroeParser.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 16/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

/// Протокол для обработки ошибок
public protocol AbstractErrorParser {
    func parse(_ result: Error)-> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
