//
//  TableViewRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol TableRouterProtocol: class {
    static func createTableViewModule() -> UIViewController
    func presentDetailView(for model: Model, from view: TableViewProtocol)
    // PRESENTER -> ROUTER
}
