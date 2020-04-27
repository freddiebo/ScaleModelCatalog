//
//  TableViewRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableRouter: BaseRouter {
    weak var presenter: TableViewOutputProtocol!
}

// MARK: - TableRouterInputProtocol
extension TableRouter: TableRouterInputProtocol {
    func presentDetailView(for model: Model, from view: TableViewInputProtocol) {
        let detailView = DetailAssembly.createDetailViewModule(for: model)
        //DetailRouter.createDetailViewModule(for: model)
        if let sourceView = view as? UICollectionViewController {
            sourceView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
