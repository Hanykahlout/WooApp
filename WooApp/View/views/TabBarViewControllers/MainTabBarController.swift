//
//  MainTabBarController.swift
//  WooApp
//
//  Created by Hany Alkahlout on 17/11/2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tabBar.unselectedItemTintColor = .black
    }

    
}
