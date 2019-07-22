//
//  ReviewCell.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 15/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

public class ReviewCell: UITableViewCell {
    @IBOutlet weak private var userIdLabel: UILabel!
    @IBOutlet weak private var commentLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Конфигурирует ячейку таблицы отзывов
    ///
    /// - Parameter review: отзыв
    func configure(review: Review) {
        if let user = review.userId {
            self.userIdLabel.text = "UserID: \(user)"
        } else {
            self.userIdLabel.text = "UserID: "
        }
        
        self.commentLabel.text = review.text
    }
    
}
