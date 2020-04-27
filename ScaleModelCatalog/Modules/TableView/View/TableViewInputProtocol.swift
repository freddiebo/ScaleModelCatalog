//
//  TableViewInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol TableViewInputProtocol: class {
    func reloadInterface(with models:[Model], groupedModels: [String : [Model]], by group: [String])
}
