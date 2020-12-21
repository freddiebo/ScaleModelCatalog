//
//  CollectionViewOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionViewOutputProtocol: class {
    func viewDidLoad()
    func pageViewDidLoad(with page: Int, where count: Int)
    func detailViewShow(model: Model, from view: CollectionViewInputProtocol)
    func updateModelInFavs(with modelId: String)
    
    var models: [Model] { get }
}
