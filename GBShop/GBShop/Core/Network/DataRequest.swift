//
//  DataRequest.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 19/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    @discardableResult
    func responseCodable<T: Decodable>(errorParser: AbstractErrorParser, queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        
        let responseSerialiser = DataResponseSerializer<T> { request, response, data, error in
            if let error = errorParser.parse(response: response, data: data, error: error ) {
                return .failure(error)
            }
            
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            switch result {
                case .success(let data):
                    do {
                        let value = try JSONDecoder().decode(T.self, from: data)
                        return .success(value)
                    } catch {
                        let customError = errorParser.parse(error)
                        return .failure(customError)
                    }
                case .failure(let error):
                    let customError = errorParser.parse(error)
                    return .failure(customError)
            }
        }
        //return response(queue: queue, responseSerialiser: responseSerialiser, completionHandler: completionHandler)
        return response(responseSerializer: responseSerialiser, completionHandler: completionHandler)
    }
}

extension DataRequest {
    @discardableResult
    func responseCodable<T: Decodable>(errorParser: AbstractErrorParser, queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
        
        let responseSerialiser = DataResponseSerializer<[T]> { request, response, data, error in
            if let error = errorParser.parse(response: response, data: data, error: error ) {
                return .failure(error)
            }
            
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            switch result {
            case .success(let data):
                do {
                    let value = try JSONDecoder().decode([T].self, from: data)
                    return .success(value)
                } catch {
                    let customError = errorParser.parse(error)
                    return .failure(customError)
                }
            case .failure(let error):
                let customError = errorParser.parse(error)
                return .failure(customError)
            }
        }
        //return response(queue: queue, responseSerialiser: responseSerialiser, completionHandler: completionHandler)
        return response(responseSerializer: responseSerialiser, completionHandler: completionHandler)
    }
}

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser {get}
    var sessionManager: SessionManager {get}
    var queue: DispatchQueue? {get}
    
    @discardableResult
    func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {
    @discardableResult
    public func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping(DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}

extension AbstractRequestFactory {
    @discardableResult
    public func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping(DataResponse<[T]>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}
