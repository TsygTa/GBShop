//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 27/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit
import Firebase

public class ReviewViewController: UIViewController {

    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBAction func onAddReviewButtonTap(_ sender: Any) {
        
        guard let userId = UserDefaults.instance.user?.id else {
            return
        }
        guard let productId = self.productId else {
            return
        }
        self.reviewTextView.endEditing(true)
        let addReview = NetworkService.instance.requestFactory.makeAddReviewRequestFactory()
        addReview.addReview(userId: userId, productId: productId, text: self.reviewTextView.text) { response in
            switch response.result {
            case .success(let value):
                print(value)
                if value.result == 1 {
                    Analytics.logEvent("AddReview", parameters: nil)
                    self.showAlert(title: "Attention", message: value.userMessage) {action in
                            self.navigationController?.popViewController(animated: true)
                        }
                } else {
                    self.showAlert(error: "Error")
                }
            case .failure(let error):
                self.showAlert(error: error.localizedDescription)
            }
        }
    }
    
    private var productId: Int?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Review"
        self.reviewTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.reviewTextView.layer.borderWidth = 1
        self.reviewTextView.layer.cornerRadius = 8
    }
    
    public init(productId: Int) {
        super.init(nibName: "ReviewViewController", bundle: nil)
        self.productId = productId
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
