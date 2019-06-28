//
//  ContainerBuilder.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 23/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Swinject

public class ContainerBuilder {
    private var _container: Container
    
    public init() {
        self._container = Container()
    }
    
    public func build() {
        self.registerNetworkServices()
    }
    
    private func registerNetworkServices() {
        self._container.register(AuthRequestFactory.self) { (authService, p, s, q) -> Auth in
            return Auth.init(errorParser: p, sessionManager: s, queue: q)
        }
    }
    
    func getAuthService() -> AuthRequestFactory? {
        return self._container.resolve(AuthRequestFactory.self)
    }
}
