//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, Scrollable {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        
        guard let login = self.userNameTextField.text, !login.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty,
            let email = self.emailTextField.text, !email.isEmpty else {
                
                self.showAlert(error: "Fill in all the fields")
                return
        }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.hideKeyboard()
        let signUp = NetworkService.instance.requestFactory.makeSignUpRequestFactory()
        var user = User(
            id: 0,
            login: login,
            password: password,
            email: email,
            name: "",
            lastname: "",
            gender: "m",
            creditCard: "",
            bio: "")
        signUp.signUp(user: user) { response in
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            switch response.result {
            case .success(let value):
                print(value)
                if value.result == 1, let userId = value.userId, userId > 0 {
                    user.id = userId
                    UserDefaults.instance.user = user
                    Analytics.logEvent("SignUp", parameters: nil)
                    self.showAlert(title: "Attention", message: value.userMessage ?? "")
                } else {
                    self.showAlert(error: value.userMessage ?? "Error")
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    init() {
        super.init(nibName: "SignUpViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
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
