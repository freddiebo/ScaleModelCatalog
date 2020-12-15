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
        print("DetailAssembly createDetailViewModule")

        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let router = DetailRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        (presenter as DetailModuleInputProtocol).setModel(model)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
