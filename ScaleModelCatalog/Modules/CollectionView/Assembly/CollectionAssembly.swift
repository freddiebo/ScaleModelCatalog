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
    
    func assembly(viewController: CollectionViewController) -> CollectionAssembly {

        let presenter = CollectionPresenter()
        let interactor = CollectionInteractor()
        let router = CollectionRouter()
            
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        //router.viewController = viewController

        //interactor.securityService = SecurityService.instance
        //interactor.notificationServiceManager = NotificationServiceManager.instance
        
        self.viewController = viewController
        self.moduleInput = presenter

        return self
    }
    
    static func createCollectionViewModule() -> UICollectionViewController {
        let view = CollectionViewController(nibName: "CollectionViewController", bundle: nil)
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
