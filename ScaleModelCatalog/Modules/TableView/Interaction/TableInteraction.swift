//
//  TableInteraction.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class TableInteractorInput: TableInteractorInputProtocol {
    let serviceServer: ServerServiceProtocol = ServerService()
    var presenter: TableInteractorOutputProtocol?
    var models = [Model]()
    
    func retrieveModels() {
        models = serviceServer.modelsAll
        presenter?.didRetrieveModels(models)
    }
}
