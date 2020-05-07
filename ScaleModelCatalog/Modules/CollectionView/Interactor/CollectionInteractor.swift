//
//  CollectionInteractorInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class CollectionInteractor: BaseInteractor {
    var serviceServer = ServerService.shared
    var presenter: CollectionInteractorOutputProtocol?
}

// MARK: - CollectionInteractorInputProtocol
extension CollectionInteractor: CollectionInteractorInputProtocol {
    func retrieveModels() {
        serviceServer.getModels() { listof in
            self.presenter?.didRetrieveModels(listof)
        }
        
        /*serviceServer.loadModels() { listof in
            self.presenter?.didRetrieveModels(listof)
        }*/
        
        presenter?.didRetrieveModels(serviceServer.list)
    }
}
