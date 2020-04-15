//  
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol DetailViewProtocol: class {
    var presenter: DetailPresenterProtocol? { get set }
    var model: Model? { get set }

    // PRESENTER -> VIEW
    func loadInterface()
}
