//
//  BasketProductCell.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 18/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

/// Класс ячейки таблицы продуктов корзины пользователя
public class BasketProductCell: UITableViewCell {
    
    private var viewController: BasketTableController?
    private var productId: Int = 0

    @IBOutlet weak private var productNameLabel: UILabel!
    
    @IBOutlet weak private var productIdLabel: UILabel!
    
    @IBOutlet weak private var productPriceLabel: UILabel!
    
    @IBOutlet weak private var quantityLabel: UILabel!
    
    @IBOutlet weak private var stepper: UIStepper!
    
    @IBAction private func onStepperTap(_ sender: Any) {
        self.quantityLabel.text = Int(stepper.value).description
        self.viewController?.onAddToBasketButtonTap(productId: self.productId, quantity: Int(stepper.value))
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Конфигурирует ячейку
    ///
    /// - Parameter product: продукт
    func configure(product: Product, viewController: BasketTableController) -> Void {
        self.productNameLabel.text = product.name
        self.productIdLabel.text = "ID:\(product.id)"
        self.productPriceLabel.text = "\(product.price) RUB"
        self.quantityLabel.text = "\(product.quantity)"
        self.stepper.value = Double(product.quantity)
        
        self.productId = product.id
        self.viewController = viewController
    }
}
