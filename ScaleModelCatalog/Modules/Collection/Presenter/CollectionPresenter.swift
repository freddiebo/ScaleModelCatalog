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
    
    private(set) var models: [Model] = []
}

// MARK: - CollectionViewOutputProtocol
extension CollectionPresenter: CollectionViewOutputProtocol {
    func pageViewDidLoad(with page: Int, where count: Int) {
        interactor?.retrievePagesModels(with: page, where: count)
    }
    
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
        #warning("тут где-то косячок 🚬")
        self.models.append(contentsOf: models)
        view?.reloadInterface()
    }
}

// MARK: - CollectionRouterOutputProtocol
extension CollectionPresenter: CollectionRouterOutputProtocol {

}
