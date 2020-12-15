//
//  ImageAssembly.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ImageAssembly: BaseAssembly {
    var moduleInput: ImageModuleInputProtocol!
    var viewController: UIViewController!
    
    static func createImageViewModule(for image: UIImage) -> UIViewController {
        let view = ImageViewController(nibName: "ImageViewController", bundle: nil)
        let presenter = ImagePresenter()
        let interactor = ImageInteractor()
        let router = ImageRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        (presenter as ImageModuleInputProtocol).setImage(image)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        return view
    }
}
