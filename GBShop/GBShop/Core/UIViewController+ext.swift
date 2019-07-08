//
//  UIViewController+ext.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 08/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(error: Error) {
        let alertVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    func showAlert(error: String) {
        let alter = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
}

