//
//  RequestRouter.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 19/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

/// Тип запроса
///
/// - url: для GET запросов
/// - json: для POST запросов
public enum RequestRouterEncoding {
    case url, json
}

/// Протокол для формирования запроса
public protocol RequestRouter: URLRequestConvertible {
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}

// MARK: - Формирование запроса
extension RequestRouter {
    
    /// URL запроса
    public var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
    /// Тип запроса
    public var encoding: RequestRouterEncoding {
        if( method == .post) {
            return .json
        }
        return .url
    }
    
    /// Формирует запрос
    ///
    /// - Returns: запрос
    /// - Throws: ошибки кодирования запроса
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue
        
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
