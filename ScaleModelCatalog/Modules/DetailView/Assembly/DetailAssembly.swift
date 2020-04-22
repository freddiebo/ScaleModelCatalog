//
//  DetailAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 20.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class DetailAssembly: BaseAssembly {
    var moduleInput: DetailModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createDetailViewModule(for model: Model) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let router = DetailRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        view.model = model
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
