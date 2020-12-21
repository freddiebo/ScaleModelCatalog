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
    private let serverService: ServerServiceProtocol = ServerService.shared
    private let favoriveService = FavoriteService.shared
    var presenter: CollectionInteractorOutputProtocol?
}

// MARK: - CollectionInteractorInputProtocol
extension CollectionInteractor: CollectionInteractorInputProtocol {
    func retrieveModels() {
        
    }
    
    func loadFavs() {
        
    }
    
    func updateFavs(with model: Model) {
        var currentFavs = loadFromFavs()
        if let isInFavs = model.isInFavs {
            if isInFavs {
                currentFavs.append(model)
            } else {
                currentFavs = currentFavs.filter { $0.id != model.id }
            }
            favoriveService.saveInFavsArray(of: currentFavs)
        }
    }
    
    func retrievePagesModels(with page: Int, where count: Int) {
        presenter?.didRetrieveFavsModels(loadFromFavs())
        let pathPagesString = "?page=\(page)&limit=\(count)"
        serverService.getPagesModel(pathPagesString: pathPagesString) { models in
            self.presenter?.didRetrieveModels(models)
        }
    }
    
}

// MARK: - Private Method
extension CollectionInteractor {
    private func loadFromFavs() -> [Model] {
        if let favModels = favoriveService.getFavsModels() {
            return favModels
        } else {
            return []
        }
    }
    
    private func syncFavs(with models: [Model]) {
        
    }
}
