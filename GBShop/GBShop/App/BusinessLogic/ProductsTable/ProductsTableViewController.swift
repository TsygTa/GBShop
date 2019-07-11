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
        
        self.tableView.register(UITableViewCell.self,forCellReuseIdentifier: "ProductCellId")
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellId", for: indexPath)
        
        let product = products[indexPath.row]
        cell.textLabel?.text = " ID: \(product.id) - " + product.name + " - \(product.price) RUB"
        return cell
    }
}
