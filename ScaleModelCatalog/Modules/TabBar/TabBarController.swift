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
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(test))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.xmark"), style: .plain, target: self, action: #selector(openAuthView))
        //navigationItem.rightBarButtonItem = AccountBarButton(image: UIImage(systemName: "person.crop.circle.badge.xmark"))
        let viewCollection = CollectionAssembly.createCollectionViewModule()
            //CollectionRouter.createCollectionViewModule()//CollectionViewController(nibName: "CollectionViewController", bundle: nil)

        viewCollection.tabBarItem = UITabBarItem(title: "All Model", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        let viewTable = TableAssembly.createTableViewModule()
        viewTable.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        viewTable.tabBarItem = UITabBarItem(title: "Group Model", image: UIImage(systemName: "list.bullet.below.rectangle"), tag: 1)
        
        let tabBarList = [viewCollection,viewTable]

        viewControllers = tabBarList
        // Do any additional setup after loading the view.

    }
    
    @objc func openAuthView() {
        let authView = AuthAssembly.createTableViewModule()
        navigationController?.pushViewController(authView, animated: true)
    }
}
