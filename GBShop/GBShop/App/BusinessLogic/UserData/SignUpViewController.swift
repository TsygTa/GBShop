//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        
        guard let login = self.userNameTextField.text, !login.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty,
            let email = self.emailTextField.text, !email.isEmpty else {
                
                self.showAlert(error: "Fill in all the fields")
                return
        }
        
        let signUp = NetworkService.instance.requestFactory.makeSignUpRequestFactory()
        let user = User(
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
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
                guard userMessage.result == 1, let message = userMessage.userMessage else {
                    self.showAlert(error: "Registration error")
                    return
                }
                UserDefaults.instance.user = user
                self.showAlert(title: "Attention", message: message)
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(error: error.localizedDescription)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
