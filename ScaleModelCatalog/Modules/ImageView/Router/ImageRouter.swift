//
//  ImageRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class ImageRouter: ImageRouterProtocol {
    class func createImageViewModule(for image: UIImage) -> UIViewController {
        let view = ImageViewController(nibName: "ImageViewController", bundle: nil)
        let presenter: ImagePresenterProtocol & ImageInteractorOutputProtocol = ImagePresenter()
        let interactor: ImageInteractorInputProtocol = ImageInteractorInput()
        let router: ImageRouterProtocol = ImageRouter()

        view.presenter = presenter
        view.imageSelected = image
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    weak var viewController: ImageViewController!
}
