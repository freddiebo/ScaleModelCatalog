//
//  CollectionRouterInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionRouterInputProtocol: class {
    // PRESENTER -> ROUTER
    func presentDetailView(for model: Model, from view: CollectionViewInputProtocol)
}
