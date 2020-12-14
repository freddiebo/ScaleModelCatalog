//
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionInteractorInputProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func retrieveModels()
    func retrievePagesModels(with page: Int, where count: Int)
}
