//
//  DetailRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

/*class DetailRouter: DetailRouterProtocol {
    class func createDetailViewModule(for model: Model) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractorInput()
        let router: DetailRouterProtocol = DetailRouter()

        view.presenter = presenter
        view.model = model
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    func presentImageView(for image: UIImage, from view: DetailViewProtocol) {
        let imageView = ImageRouter.createImageViewModule(for: image)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(imageView, animated: true)
        }
    }
    weak var viewController: DetailViewController!
}*/

class DetailRouter: BaseRouter {
    weak var presenter: DetailViewOutputProtocol!
}

// MARK: - DetailRouterInputProtocol
extension DetailRouter: DetailRouterInputProtocol {
    func presentImageView(for image: UIImage, from view: DetailViewInputProtocol) {
        let imageView = ImageRouter.createImageViewModule(for: image)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(imageView, animated: true)
        }
    }
}
