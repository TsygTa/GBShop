//
//  RootViewController.swift
//  GBShop
//
//  Created by Tatiana Tsygankova on 07/07/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private var currentViewController: UIViewController
    
    public init() {
        self.currentViewController = AuthViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(self.currentViewController)
        currentViewController.view.frame = self.view.bounds
        self.view.addSubview(currentViewController.view)
        currentViewController.didMove(toParent: self)
    }

}
