//
//  CollectionAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class CollectionAssembly: BaseAssembly {
    var moduleInput: CollectionModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createCollectionViewModule() -> UIViewController {
        let view = CollectionViewController(nibName: "ViewController", bundle: nil)
        let presenter = CollectionPresenter()
        let interactor = CollectionInteractor()
        let router = CollectionRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
