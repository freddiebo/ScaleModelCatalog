//
//  TableInteractorOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol TableInteractorOutputProtocol: class {
    func didRetrieveModels(_ models: [Model])
}
