//
//  ReviewsTableController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 15/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class ReviewsTableController: UITableViewController {
    
    private var reviews: [Review] = []
    private var productId: Int = 0
    
    
    public init(productId: Int) {
        super.init(style: .plain)
        self.productId = productId
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")
        
        let reviewsList = NetworkService.instance.requestFactory.makeReviewsListRequestFactory()
        
        reviewsList.getReviewsList(page: 1, productId: self.productId) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.reviews = value.reviews
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else {
            return UITableViewCell()
        }
        
        let review = reviews[indexPath.row]
        
        cell.configure(review: review)
        
        return cell
    }

}
