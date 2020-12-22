//
//  FavsViewControllerOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

protocol FavsViewControllerOutputProtocol: class {
    func viewDidLoad()
    
    var favsModels: [Model] { get }
}
