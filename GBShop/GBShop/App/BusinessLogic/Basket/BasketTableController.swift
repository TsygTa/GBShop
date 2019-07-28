//
//  BasketTableController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 18/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit
import Firebase

public class BasketTableController: UITableViewController {
    private var basket: Basket?
    private var basketProducts: [Product] = []
    
    private let totalLabel = UILabel()
    private let payButton  = UIButton(type: UIButton.ButtonType.system)

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "BasketProductCell", bundle: nil), forCellReuseIdentifier: "BasketProductCell")
        
        self.tabBarController?.navigationItem.title = "Basket"
        
        self.tableView.register(UINib(nibName: "BasketProductCell", bundle: nil), forCellReuseIdentifier: "BasketProductCell")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Basket"
        guard let userId = UserDefaults.instance.user?.id else {
            return
        }
        let basket = NetworkService.instance.requestFactory.makeBasketRequestFactory()
        
        basket.getBasket(userId: userId) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.basket = value
                self.basketProducts = value.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func onAddToBasketButtonTap(productId: Int, quantity: Int) {
        guard let user = UserDefaults.instance.user else {
            return
        }
        let addToBasket = NetworkService.instance.requestFactory.makeAddToBasketRequestFactory()
        addToBasket.addToBasket(userId: user.id, productId: productId, quantity: quantity) { response in
            switch response.result {
            case .success(let value):
                if value.result == 1 {
                    if let index = self.basket?.products.firstIndex(where: {$0.id == productId}), index >= 0 {
                        self.basket!.products[index].quantity = quantity
                    }
                    self.totalLabel.text = "Total: \(self.basket!.total) RUB"
                } else {
                    self.showAlert(error: "An error occurred")
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(error: error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.basketProducts.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketProductCell", for: indexPath) as? BasketProductCell else {
            return UITableViewCell()
        }
        
        cell.configure(product: self.basketProducts[indexPath.row], viewController: self)

        return cell
    }
    
    override public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let user = UserDefaults.instance.user else {
            return
        }
        
        if editingStyle == .delete {
            
            let deleteFromBasket = NetworkService.instance.requestFactory.makeDeleteFromBasketRequestFactory()
            deleteFromBasket.deleteFromBasket(userId: user.id, productId: basketProducts[indexPath.row].id) { response in
                switch response.result {
                case .success(let value):
                    if value.result == 1 {
                        Analytics.logEvent("DeleteFromBasket", parameters: nil)
                        self.basketProducts.remove(at: indexPath.row)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } else {
                        self.showAlert(error: value.errorMessage ?? "")
                    }
                case .failure(let error):
                    self.showAlert(error: error.localizedDescription)
                }
            }
        }
    }
    override public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0) {
            
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            if let total = self.basket?.total {
                totalLabel.text="Total: \(total) RUB"
            } else {
                totalLabel.text="Total: 0"
            }
            
            if let status = self.basket?.isPaid,
                status {
                self.setPaidStatus()
            }
            
            payButton.setTitle("Payment", for: .normal)
            payButton.addTarget(self, action: #selector(onPayTap(_:)), for: .touchUpInside)
            
            view.addSubview(totalLabel)
            view.addSubview(payButton)
            
            totalLabel.translatesAutoresizingMaskIntoConstraints = false
            payButton.translatesAutoresizingMaskIntoConstraints = false
            
            let views = ["label": totalLabel, "button": payButton, "view": view]
            
            let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]-60-[button]-10-|", options: .alignAllCenterY, metrics: nil, views: views)
            view.addConstraints(horizontallayoutContraints)
            
            let verticalLayoutContraint = NSLayoutConstraint(item: totalLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
            view.addConstraint(verticalLayoutContraint)
            
            return view
        }
        
        return nil
    }
    
    @objc private func onPayTap(_ sender: UIButton) {
        
        guard let userId = UserDefaults.instance.user?.id else {
            return
        }
        
        let payment = NetworkService.instance.requestFactory.makePaymentRequestFactory()
        payment.payment(userId: userId) { response in
            switch response.result {
            case .success(let value):
                print(value)
                if value.result == 1 {
                    Analytics.logEvent("Paid", parameters: nil)
                    self.showAlert(title: "Attention", message: value.userMessage)
                    self.setPaidStatus()
                } else {
                    self.showAlert(error: "Error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setPaidStatus() {
        self.totalLabel.text = "PAID"
        self.totalLabel.textColor = UIColor.red
        self.payButton.isHidden = true
    }
}
