//
//  AuthAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 28.08.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class AuthAssembly: BaseAssembly {
    var moduleInput: AuthModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createTableViewModule() -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        let router = AuthRouter()

        /*
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
         */

        return view
    }
}
