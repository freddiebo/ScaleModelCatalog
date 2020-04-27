//
//  TablePresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TablePresenter: BasePresenter {
    weak var view: TableViewInputProtocol?
    var interactor: TableInteractorInputProtocol?
    var router: TableRouterInputProtocol?
    var GroupManufacture = [String: [Model]]()
    var listOfManufacture = [String] ()
    
    func parseToGroup(_ models: [Model]) {
        for model in models {
            if (!GroupManufacture.keys.contains(model.manufacturer))
            {
                GroupManufacture[model.manufacturer] = [model]
                listOfManufacture.append(model.manufacturer)
            } else {
                GroupManufacture[model.manufacturer]?.append(model)
            }
        }
    }
}

// MARK: - TableViewOutputProtocol
extension TablePresenter: TableViewOutputProtocol {
    func viewDidLoad() {
        interactor?.retrieveModels()
    }
    func detailViewShow(model: Model, from view: TableViewInputProtocol) {
        router?.presentDetailView(for: model, from: view)
    }
}

// MARK: - TableModuleInputProtocol
extension TablePresenter: TableModuleInputProtocol {

}

// MARK: - TableInteractorOutputProtocol
extension TablePresenter: TableInteractorOutputProtocol {
    func didRetrieveModels(_ models: [Model]) {
        parseToGroup(models)
        view?.reloadInterface(with: models,groupedModels: GroupManufacture, by: listOfManufacture)
    }
}

// MARK: - TableRouterOutputProtocol
extension TablePresenter: TableRouterOutputProtocol {

}
