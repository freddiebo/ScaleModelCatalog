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
    func retrievePagesModels(with page: Int, where count: Int) {
        //Model?page=1&limit=3
        print("interactor page \(page) count \(count)")
        let pathPages = "?page=\(page)&limit=\(count)"
        print(pathPages)
        serviceServer.pathPages = pathPages
        serviceServer.getPagesModel() { models in
            self.presenter?.didRetrieveModels(models)
            print(models)
        } 
    }
    
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
