//
//  UserInfoViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, Scrollable {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var creditCardTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
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
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            switch response.result {
            case .success(let value):
                print(value)
                if value.result == 1 {
                    self.showAlert(title: "Attention", message: "User data has been changed")
                }
            case .failure(let error):
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    init() {
        super.init(nibName: "UserInfoViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title = "User Profile"
        
        self.activityIndicator.isHidden = true
        
        self.userNameTextField.text = UserDefaults.instance.user?.login
        self.passwordTextField.text = UserDefaults.instance.user?.password
        self.emailTextField.text = UserDefaults.instance.user?.email
        self.genderTextField.text = UserDefaults.instance.user?.gender
        self.creditCardTextField.text = UserDefaults.instance.user?.creditCard
        self.firstNameTextField.text = UserDefaults.instance.user?.name
        self.lastNameTextField.text = UserDefaults.instance.user?.lastname
        
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
        self.hideKeyboard(scrollView: scrollView)
    }
}
