//
//  TabBarController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 03.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let CollectionView = CollectionViewController(nibName: "CollectionViewController", bundle: nil)

        CollectionView.tabBarItem = UITabBarItem(title: "All Model", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        let TableView = TableViewController(style: .grouped)
        //TableView.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        TableView.tabBarItem = UITabBarItem(title: "Group Model", image: UIImage(systemName: "list.bullet.below.rectangle"), tag: 1)
        
        let tabBarList = [CollectionView,TableView]

        viewControllers = tabBarList
        // Do any additional setup after loading the view.

    }
    
}
