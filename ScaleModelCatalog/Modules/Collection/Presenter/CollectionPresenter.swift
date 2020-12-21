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
    private var favsModels: [Model] = []
}

// MARK: - CollectionViewOutputProtocol
extension CollectionPresenter: CollectionViewOutputProtocol {
    func updateModelInFavs(with modelId: String) {
        let findModel = models.filter{
            $0.id == modelId
        }
        if var model = findModel.first {
            if let isInFavs = model.isInFavs {
                model.isInFavs = isInFavs ? false : true
            }
            interactor?.updateFavs(with: model)
        }
    }
    
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
    func didRetrieveFavsModels(_ models: [Model]) {
        self.favsModels = models
    }
    
    func didRetrieveModels(_ models: [Model]) {
        self.models.append(contentsOf: models)
        syncModelsWithFavs()
        view?.reloadInterface()
        print(self.models)
    }
}

// MARK: - CollectionRouterOutputProtocol
extension CollectionPresenter: CollectionRouterOutputProtocol {

}

// MARK: - Private Methods
extension CollectionPresenter {
    private func syncModelsWithFavs() {
        models.indices.forEach() { indexModel in
            if let _ = favsModels.firstIndex(where: { $0.id == models[indexModel].id}) {
                models[indexModel].isInFavs = true
            } else {
                models[indexModel].isInFavs = false
            }
        }
    }

}
