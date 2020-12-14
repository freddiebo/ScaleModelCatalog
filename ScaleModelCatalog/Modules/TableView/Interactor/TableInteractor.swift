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
        let pathPagesString = "?sortBy=manufacturer&order=asc&page=\(page)&limit=\(count)"
        print(pathPagesString)
        serviceServer.getSortModels(pathPagesString: pathPagesString) { models in
            self.presenter?.didRetrieveModels(models)
        }
    }
    func retrieveSortModels() {
        let pathPagesString = "?sortBy=manufacturer&order=asc"
        serviceServer.getSortModels(pathPagesString: pathPagesString) { models in
            self.presenter?.didRetrieveModels(models)
        }
    }
}
