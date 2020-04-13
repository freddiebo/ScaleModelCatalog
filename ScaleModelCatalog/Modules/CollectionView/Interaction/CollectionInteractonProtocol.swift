//
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveModels(_ models: [Model])
}

protocol CollectionInteractorInputProtocol: class {
    var presenter: CollectionInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func retrieveModels()
}
