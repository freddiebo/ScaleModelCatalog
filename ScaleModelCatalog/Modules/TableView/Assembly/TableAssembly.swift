//
//  TableAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableAssembly: BaseAssembly {
    var moduleInput: TableModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createTableViewModule() -> UITableViewController {
        let view = TableViewController(style: .grouped)
        let presenter = TablePresenter()
        let interactor = TableInteractor()
        let router = TableRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
