//
//  ProductViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 28/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {
    
    private let productId: Int
    
    @IBOutlet weak var productIdLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productDescriptionText: UITextView!
    
    @IBAction func onAddToBasketTap(_ sender: Any) {
        guard let user = UserDefaults.instance.user else {
            return
        }
        let addToBasket = NetworkService.instance.requestFactory.makeAddToBasketRequestFactory()
        addToBasket.addToBasket(userId: user.id, productId: productId, quantity: 1) { response in
            switch response.result {
            case .success(let value):
                if value.result == 1 {
                    Analytics.logEvent("AddToBasket-ProductView", parameters: nil)
                    self.showAlert(title: "Attention", message: "The product has been added to basket")
                } else {
                    self.showAlert(error: "An error occurred")
                }
            case .failure(let error):
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    @IBAction func onShowReviewTap(_ sender: Any) {
        self.navigationController?.pushViewController(ReviewsTableController(productId: productId), animated: true)
    }
    
    public init(productId: Int) {
        self.productId = productId
        super.init(nibName: "ProductViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Product"
        
        let productRequest = NetworkService.instance.requestFactory.makeProductDataRequestFactory()
        
        productRequest.getProductData(productId: productId, completionHandler: { response in
            switch response.result {
            case .success(let value):
                if value.result == 1 {
                    self.productIdLabel.text = "\(value.product.id)"
                    self.productNameLabel.text = value.product.name
                    self.productPriceLabel.text = "\(value.product.price)"
                    self.productDescriptionText.text = value.product.description
                } else {
                    self.showAlert(error: value.errorMessage ?? "Error")
                }
                
            case .failure(let error):
                self.showAlert(error:error.localizedDescription)
            }
        })
        
        self.productDescriptionText.layer.borderColor = UIColor.lightGray.cgColor
        self.productDescriptionText.layer.borderWidth = 1
        self.productDescriptionText.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Analytics.logEvent("ProductView", parameters: nil)
    }
}
