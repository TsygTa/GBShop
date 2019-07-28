//
//  UIViewController+ext.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 08/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Содержит методы, расширяющие UIViewController
extension UIViewController {
    /// Выводитокно с ошибкой
    ///
    /// - Parameter error: ошибка
    func showAlert(error: Error) {
        let alertVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    /// Выводит окно с ошибкой
    ///
    /// - Parameter error: строка с ошибкой
    func showAlert(error: String) {
        let alter = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
    
    /// Выводит окно с сообщением
    ///
    /// - Parameters:
    ///   - title: строка с заголовком окна
    ///   - message: строка с сообщением
    func showAlert(title: String, message: String) {
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, handler: @escaping (UIAlertAction)->Void) {
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: handler)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
}

// MARK: - Содержит методы, расширяющие UIViewController и
// реализующие протокол Scrollable

/// Протокол Scrollable для реализации скроллинга при появлении клавиатуры
public protocol Scrollable {}

extension Scrollable where Self: UIViewController {
    
    func keyBoardWasShown(notification: Notification, scrollView: UIScrollView) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func keyBoardWillBeHidden(notification: Notification, scrollView: UIScrollView) {
        
        let contentInsets = UIEdgeInsets.zero
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func hideKeyboard(scrollView: UIScrollView) {
        scrollView.endEditing(true)
    }
}
// MARK: - Содержит методы, расширяющие UIView
public extension UIView {
    
    /// Загружает View из xib.
    ///
    /// - Returns: итоговое view.
    func loadNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        guard let nameNib = type(of: self).description().components(separatedBy: ".").last else {
            return nil
        }
        let nib = UINib(nibName: nameNib, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

