//
//  FavsInteractor.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

class FavsInteractor: BaseInteractor {
    var presenter: FavsInteractorOutputProtocol?
    private let favoriveService = FavoriteService.shared
}

// MARK: - FavsInteractorInputProtocol
extension FavsInteractor: FavsInteractorInputProtocol {
    func retrieveFavsModels() {
        var favsModels = [Model]()
        if let loadsModels = favoriveService.getFavsModels() {
            favsModels = loadsModels
        }
        presenter?.didRetrieveFavsModels(favsModels)
    }
}
