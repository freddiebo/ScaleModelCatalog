//
//  TableInteraction.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableInteractor: BaseInteractor {
    var serviceServer = ServerService.shared
    var presenter: TableInteractorOutputProtocol?
}

// MARK: - TableInteractorInputProtocol
extension TableInteractor: TableInteractorInputProtocol {
    func retrieveModels() {
        serviceServer.loadModels() { listof in
            self.presenter?.didRetrieveModels(listof)
        }
    }
}
