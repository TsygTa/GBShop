//
//  UserInfoViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var creditCardTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBAction func onSaveButtonTap(_ sender: Any) {
        
        guard let login = self.userNameTextField.text, !login.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty,
            let email = self.emailTextField.text, !email.isEmpty else {
                
                self.showAlert(error: "Required fields are marked with an asterisk")
                return
        }
        guard let user = UserDefaults.instance.user, user.id > 0 else {
            return
        }
        
        let changeUserData = NetworkService.instance.requestFactory.makeChangeUserDataRequestFactory()
        
        let userDataForChange = User(
            id: user.id,
            login: login,
            password: password,
            email: email,
            name: firstNameTextField.text ?? "",
            lastname: lastNameTextField.text ?? "",
            gender: genderTextField.text ?? "m",
            creditCard: creditCardTextField.text ?? "",
            bio: bioTextField.text ?? "")
        changeUserData.changeData(user: userDataForChange) { response in
            switch response.result {
            case .success(let value):
                print(value)
                if value.result == 1 {
                    self.showAlert(title: "Attention", message: "User data has been changed")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        self.userNameTextField.text = UserDefaults.instance.user?.login
        self.passwordTextField.text = UserDefaults.instance.user?.password
        self.emailTextField.text = UserDefaults.instance.user?.email
        self.genderTextField.text = UserDefaults.instance.user?.gender
        self.creditCardTextField.text = UserDefaults.instance.user?.creditCard
        self.firstNameTextField.text = UserDefaults.instance.user?.name
        self.lastNameTextField.text = UserDefaults.instance.user?.lastname
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
