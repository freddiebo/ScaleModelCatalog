//
//  DetailPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenter: BasePresenter {
    weak var view: DetailViewInputProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterInputProtocol?
    
    private(set) var model: Model?
}

// MARK: - DetailViewOutputProtocol
extension DetailPresenter: DetailViewOutputProtocol {
    
    func viewDidLoad() {
        print("DetailPresenter viewDidLoad")
        view?.loadInterface()
    }
    
    func imageViewShow(image: UIImage, from view: DetailViewInputProtocol) {
        print("DetailPresenter imageViewShow")
        router?.presentImageView(for: image, from: view)
    }
}

// MARK: - DetailModuleInputProtocol
extension DetailPresenter: DetailModuleInputProtocol {
    func setModel(_ model: Model) {
        self.model = model
    }

}

// MARK: - DetailInteractorOutputProtocol
extension DetailPresenter: DetailInteractorOutputProtocol {

}

// MARK: - DetailRouterOutputProtocol
extension DetailPresenter: DetailRouterOutputProtocol {

}
