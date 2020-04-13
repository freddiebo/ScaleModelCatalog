//
//  TableViewCollectionProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewProtocol: class {
    var presenter: TablePresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func reloadInterface(with model:[Model],groupedModels: [String: [Model]], by group:[String])
}
