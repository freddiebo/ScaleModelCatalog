//
//  CollectionPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionPresenter: CollectionPresenterProtocol {
    weak var view: CollectionViewProtocol?
    var interactor: CollectionInteractorInputProtocol?
    var router: CollectionRouterProtocol?

    func viewDidLoad() {
        interactor?.retrieveModels()
    }
    
    func detailViewShow(model: Model, from view: CollectionViewProtocol) {
        router?.presentDetailView(for: model, from: view)
    }
}

extension CollectionPresenter: CollectionInteractorOutputProtocol {
    func didRetrieveModels(_ models: [Model]) {
        view?.reloadInterface(with: models)
    }
}
