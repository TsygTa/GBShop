//
//  ErrorParser.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 19/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation

/// Обработка ошибок
class ErrorParser: AbstractErrorParser {
    
    /// Обработка ошибок
    ///
    /// - Parameter result: ошибка в результате запроса
    /// - Returns: ошибка
    public func parse(_ result: Error) -> Error {
        return result
    }
    
    /// Обработка ошибок
    ///
    /// - Parameters:
    ///   - response: запрос
    ///   - data: данные - результат запроса
    ///   - error: ошибка данных
    /// - Returns: ошибка
    public func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
    
    
}
