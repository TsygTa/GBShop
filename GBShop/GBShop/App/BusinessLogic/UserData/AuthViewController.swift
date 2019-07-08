//
//  AuthViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
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
            switch response.result {
            case .success(let login):
                print(login)
                UserDefaults.instance.user = login.user
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.navigationController?.pushViewController(UserInfoViewController(nibName: "UserInfoViewController", bundle: nil), animated: true)
            case .failure(let error):
                print(error.localizedDescription)
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        UserDefaults.instance.user = User()
        self.navigationController?.pushViewController(SignUpViewController(nibName: "SignUpViewController", bundle: nil), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(hideKeyboardGesture)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }

}
