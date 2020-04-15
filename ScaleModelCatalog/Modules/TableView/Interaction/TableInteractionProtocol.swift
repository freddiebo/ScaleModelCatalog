//
//  TableInteractionProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol TableInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveModels(_ models: [Model])
}

protocol TableInteractorInputProtocol: class {
    var presenter: TableInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func retrieveModels()
}
