//
//  TablePresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class TablePresenter: TablePresenterProtocol {
    weak var view: TableViewProtocol?
    var interactor: TableInteractorInputProtocol?
    var router: TableRouterProtocol?
    var GroupManufacture = [String: [Model]]()
    var listOfManufacture = [String] ()
    
    func viewDidLoad() {
        interactor?.retrieveModels()
    }
    
    func detailViewShow(model: Model, from view: TableViewProtocol) {
        router?.presentDetailView(for: model, from: view)
    }
    
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

extension TablePresenter: TableInteractorOutputProtocol {

    func didRetrieveModels(_ models: [Model]) {
        parseToGroup(models)
        view?.reloadInterface(with: models,groupedModels: GroupManufacture, by: listOfManufacture)
    }
}
