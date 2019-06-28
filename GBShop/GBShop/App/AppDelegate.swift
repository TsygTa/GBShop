//
//  AppDelegate.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 16/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()
    
    private var containerBuilder: ContainerBuilder?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        let signUp = requestFactory.makeSignUpRequestFactory()
        let userData = UserData(id: 123, email: "some@some.ru", gender: .male, creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        signUp.signUp(userName: "Somebody", password: "mypassword", userData: userData) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let changeUserData = requestFactory.makeChangeUserDataRequestFactory()
        let userDataForChange = UserData(id: 123, email: "some@some.ru", gender: .male, creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        changeUserData.changeData(userName: "Somebody", password: "mypassword", userData: userDataForChange) { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let logOut = requestFactory.makeLogOutRequestFactory()
        logOut.logOut(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let productsList = requestFactory.makeProductsListRequestFactory()
        productsList.getProductsList(page: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let productData = requestFactory.makeProductDataRequestFactory()
        productData.getProductData(productId: 123) { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        self.containerBuilder = ContainerBuilder()
        self.containerBuilder?.build()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

