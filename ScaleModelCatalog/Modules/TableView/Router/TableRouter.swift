//
//  TableViewRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class TableRouter: TableRouterProtocol {
    
    class func createTableViewModule() -> UIViewController {
        let view = TableViewController(style: .grouped)
        let presenter: TablePresenterProtocol & TableInteractorOutputProtocol = TablePresenter()
        let interactor: TableInteractorInputProtocol = TableInteractorInput()
        let router: TableRouterProtocol = TableRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    func presentDetailView(for model: Model, from view: TableViewProtocol) {
        let detailView = DetailAssembly.createDetailViewModule(for: model)
        if let sourceView = view as? UITableViewController {
            sourceView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
    weak var viewController: TableViewController!
}
