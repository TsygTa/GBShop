//
//  ProductCell.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 18/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

public class ProductCell: UITableViewCell {
    
    private var viewController: ProductsTableViewController?
    private var productId: Int = 0
    
    @IBOutlet weak private var productNameLabel: UILabel!
    
    @IBOutlet weak private var productIdLabel: UILabel!
    
    @IBOutlet weak private var productPriceLabel: UILabel!
    
    @IBAction func onShowReviewsButtonTap(_ sender: Any) {
        self.viewController?.onShowReviewButtonTap(productId: self.productId)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)  {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Конфигурирует ячейку таблицы товаров
    ///
    /// - Parameters:
    ///   - product: товар
    ///   - viewController: контроллер списка товаров
    func configure(product: Product, viewController: ProductsTableViewController) {
        
        self.productNameLabel.text = product.name
        self.productIdLabel.text = "ID: \(product.id)"
        self.productPriceLabel.text = "\(product.price) RUB"
        
        self.productId = product.id
        self.viewController = viewController
    }
}
