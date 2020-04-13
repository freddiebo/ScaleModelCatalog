//
//  CollectionRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 10.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionRouter: CollectionRouterProtocol {
    class func createCollectionViewModule() -> UICollectionViewController {
        let view = CollectionViewController(nibName: "CollectionViewController", bundle: nil)
        let presenter: CollectionPresenterProtocol & CollectionInteractorOutputProtocol = CollectionPresenter()
        let interactor: CollectionInteractorInputProtocol = CollectionInteractorInput()
        let router: CollectionRouterProtocol = CollectionRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    weak var viewController: CollectionViewController!
    
    func presentDetailView(for model: Model, from view: CollectionViewProtocol) {
        let detailView = DetailRouter.createDetailViewModule(for: model)
        if let sourceView = view as? UICollectionViewController {
            sourceView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
