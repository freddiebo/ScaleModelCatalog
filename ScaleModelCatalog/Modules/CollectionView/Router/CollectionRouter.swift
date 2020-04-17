//
//  CollectionRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 10.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionRouter:BaseRouter {
    weak var presenter: CollectionViewOutputProtocol!
}

extension CollectionRouter: CollectionRouterInputProtocol {
    func presentDetailView(for model: Model, from view: CollectionViewInputProtocol) {
        let detailView = DetailRouter.createDetailViewModule(for: model)
        if let sourceView = view as? UICollectionViewController {
            sourceView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
