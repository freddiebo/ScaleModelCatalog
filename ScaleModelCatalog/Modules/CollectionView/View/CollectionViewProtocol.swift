//  
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionViewProtocol: class {
    var presenter: CollectionPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func reloadInterface(with models: [Model])
}
