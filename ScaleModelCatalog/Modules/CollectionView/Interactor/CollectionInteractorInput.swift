//
//  CollectionInteractorInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionInteractorInput: CollectionInteractorInputProtocol {
    
    let serviceServer: ServerServiceProtocol = ServerService()
    var presenter: CollectionInteractorOutputProtocol?
    
    func retrieveModels() {
        presenter?.didRetrieveModels(serviceServer.models)
    }
}
