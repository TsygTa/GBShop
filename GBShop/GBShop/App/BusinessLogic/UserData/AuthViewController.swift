//
//  AuthViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, Scrollable {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func onLoginButtonTap(_ sender: Any) {
        
        guard let userName = userNameTextField.text, !userName.isEmpty,
        let password = passwordTextField.text, !password.isEmpty else {
            self.showAlert(error: "User name or password is wrong")
            return
        }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        let auth = NetworkService.instance.requestFactory.makeAuthRequestFactory()
        auth.login(userName: userName, password: password) { response in
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            switch response.result {
            case .success(let login):
                print(login)
                UserDefaults.instance.user = login.user
        
                self.navigationController?.pushViewController(self.createTabBarController(), animated: true)
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let productsTableViewController = ProductsTableViewController()
        productsTableViewController.tabBarItem = UITabBarItem(title: "Products", image: nil, tag: 0)
        tabBarController.addChild(productsTableViewController)
        let userInfoViewController = UserInfoViewController()
        userInfoViewController.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 1)
        tabBarController.addChild(userInfoViewController)
        return tabBarController
    }
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        UserDefaults.instance.user = User()
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    init() {
        super.init(nibName: "AuthViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(hideKeyboardGesture)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyBoardWasShown(notification: Notification) {
        keyBoardWasShown(notification: notification, scrollView: scrollView)
    }
    
    @objc func keyBoardWillBeHidden(notification: Notification) {
        
        keyBoardWillBeHidden(notification: notification, scrollView: scrollView)
    }
    
    @objc func hideKeyboard() {
        hideKeyboard(scrollView: scrollView)
    }

}
