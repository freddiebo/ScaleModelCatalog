//
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionRouterProtocol: class {
    static func createCollectionViewModule() -> UICollectionViewController

    // PRESENTER -> ROUTER
    func presentDetailView(for model: Model, from view: CollectionViewProtocol)
}
