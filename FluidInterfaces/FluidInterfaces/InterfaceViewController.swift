//
//  InterfaceViewController.swift
//  FluidInterfaces
//
//  Created by Spock on 2019/6/24.
//  Copyright © 2019 Spock. All rights reserved.
//

import UIKit

/// Base class for all interface view controllers.
class InterfaceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.05, alpha: 1) // 避免前頁背景產生延遲
        navigationItem.largeTitleDisplayMode = .never
    }
}
