//
//  SignUpAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 28.08.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class SignUpAssembly: BaseAssembly {
    var moduleInput: SignUpModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createTableViewModule() -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter()
        let interactor = SignUpInteractor()
        let router = SignUpRouter()

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
