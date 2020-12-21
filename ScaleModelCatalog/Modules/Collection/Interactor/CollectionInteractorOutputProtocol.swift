//
//  CollectionInteractorOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveModels(_ models: [Model])
    func didRetrieveFavsModels(_ models: [Model])
}
