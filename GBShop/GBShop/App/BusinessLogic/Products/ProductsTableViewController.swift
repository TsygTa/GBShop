//
//  ProductsTableViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 10/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.title = "Products Catalog"
    
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        let productsList = NetworkService.instance.requestFactory.makeProductsListRequestFactory()
        
        productsList.getProductsList(page: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.products = value.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public func onShowReviewButtonTap(productId: Int) {
        self.navigationController?.pushViewController(ReviewsTableController(productId: productId), animated: true)
    }
    
    public func onAddToBasketButtonTap(productId: Int) {
        let addToBasket = NetworkService.instance.requestFactory.makeAddToBasketRequestFactory()
        addToBasket.addToBasket(productId: productId, quantity: 1) { response in
            switch response.result {
            case .success(let value):
                if value.result == 1 {
                    self.showAlert(title: "Attention", message: "The product has been added to basket")
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        let product = products[indexPath.row]
        
        cell.configure(product: product, viewController: self)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
