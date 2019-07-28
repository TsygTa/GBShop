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
    
    private let addReviewButton  = UIButton(type: UIButton.ButtonType.system)
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Reviews"
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
    
    override public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0) {
            
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            addReviewButton.setTitle("Add review", for: .normal)
            addReviewButton.addTarget(self, action: #selector(onAddReviewButtonTap(_:)), for: .touchUpInside)
            
            view.addSubview(addReviewButton)
            
            addReviewButton.translatesAutoresizingMaskIntoConstraints = false
            
            let views = ["button": addReviewButton, "view": view]
            
            let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-200-[button]-10-|", options: .alignAllCenterY, metrics: nil, views: views)
            view.addConstraints(horizontallayoutContraints)
            
            let verticalLayoutContraint = NSLayoutConstraint(item: addReviewButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
            view.addConstraint(verticalLayoutContraint)
            
            return view
        }
        
        return nil
    }
    
    @objc private func onAddReviewButtonTap(_ sender: UIButton) {
        
        let reviewViewController = ReviewViewController(productId: self.productId)
        self.navigationController?.pushViewController(reviewViewController, animated: true)
    }
    
    override public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard self.reviews[indexPath.row].userId == UserDefaults.instance.user?.id else {
            return false
        }
        return true
    }
    
    override public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard self.reviews[indexPath.row].userId == UserDefaults.instance.user?.id else {
            return
        }
        
        if editingStyle == .delete {
            
            let removeReview = NetworkService.instance.requestFactory.makeRemoveReviewRequestFactory()
            removeReview.removeReview(reviewId: self.reviews[indexPath.row].id) { response in
                switch response.result {
                case .success(let value):
                    if value.result == 1 {
                        self.reviews.remove(at: indexPath.row)
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
}
