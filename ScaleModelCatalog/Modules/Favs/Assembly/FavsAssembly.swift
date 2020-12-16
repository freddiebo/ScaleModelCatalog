//
//  FavsAssembly.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class FavsAssembly: BaseAssembly {
    var moduleInput: FavsModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createFavsViewModule() -> UIViewController {
        let view = FavsViewController()
        let presenter = FavsPresenter()
        let interactor = FavsInteractor()
        let router = FavsRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
