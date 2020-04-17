//
//  CollectionPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionPresenter: BasePresenter {
    weak var view: CollectionViewInputProtocol?
    var interactor: CollectionInteractorInputProtocol?
    var router: CollectionRouterInputProtocol?
}

// MARK: - CollectionViewOutputProtocol
extension CollectionPresenter: CollectionViewOutputProtocol {
    func viewDidLoad() {
        interactor?.retrieveModels()
    }
    func detailViewShow(model: Model, from view: CollectionViewInputProtocol) {
        router?.presentDetailView(for: model, from: view)
    }
}

// MARK: - CollectionModuleInputProtocol
extension CollectionPresenter: CollectionModuleInputProtocol {

}

// MARK: - CollectionInteractorOutputProtocol
extension CollectionPresenter: CollectionInteractorOutputProtocol {
    func didRetrieveModels(_ models: [Model]) {
        view?.reloadInterface(with: models)
    }
}

// MARK: - CollectionRouterOutputProtocol
extension CollectionPresenter: CollectionRouterOutputProtocol {

}
