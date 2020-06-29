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
    func retrievePagesModels(with page: Int, where count: Int) {
        let pathPages = "?sortBy=manufacturer&order=asc&page=\(page)&limit=\(count)"
        print(pathPages)
        serviceServer.pathPages = pathPages
        serviceServer.getSortModels() { listof in
            self.presenter?.didRetrieveModels(listof)
        }
    }
    func retrieveSortModels() {
        serviceServer.pathPages = "?sortBy=manufacturer&order=asc"
        serviceServer.getSortModels() { listof in
            self.presenter?.didRetrieveModels(listof)
        }
    }
}
