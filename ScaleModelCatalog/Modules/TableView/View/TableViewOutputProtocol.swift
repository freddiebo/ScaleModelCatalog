//
//  TableViewOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol TableViewOutputProtocol: class {
    func viewDidLoad()
    func detailViewShow(model: Model, from view: TableViewInputProtocol)
}
