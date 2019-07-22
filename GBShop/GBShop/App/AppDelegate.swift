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

    internal var window: UIWindow?
    private let requestFactory = NetworkService.instance.requestFactory
    
    private var containerBuilder: ContainerBuilder?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: AuthViewController())
        window?.makeKeyAndVisible()


//        let logOut = requestFactory.makeLogOutRequestFactory()
//        logOut.logOut(userId: 123) { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        let productData = requestFactory.makeProductDataRequestFactory()
//        productData.getProductData(productId: 123) { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//
//        let addReview = requestFactory.makeAddReviewRequestFactory()
//        addReview.addReview(userId: 123, text: "Текст отзыва") { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        let removeReview = requestFactory.makeRemoveReviewRequestFactory()
//        removeReview.removeReview(reviewId: 123) { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

        
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

