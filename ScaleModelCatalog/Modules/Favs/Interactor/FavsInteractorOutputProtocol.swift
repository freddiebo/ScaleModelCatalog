//
//  FavsInteractorOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

protocol FavsInteractorOutputProtocol: class {
    func didRetrieveFavsModels(_ models: [Model])
}
