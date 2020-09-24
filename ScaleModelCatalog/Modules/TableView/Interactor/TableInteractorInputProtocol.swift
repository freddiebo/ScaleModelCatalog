//
//  TableInputInteractorProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol TableInteractorInputProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func retrievePagesModels(with page: Int, where count: Int)
    func retrieveSortModels()
}
