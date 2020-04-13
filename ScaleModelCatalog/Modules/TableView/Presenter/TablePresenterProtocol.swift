//
//  TablePresenterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol TablePresenterProtocol: class {
    var view: TableViewProtocol? { get set }
    var interactor: TableInteractorInputProtocol? { get set }
    var router: TableRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad() // инициализация и конфигурирование первоначальных данных для view
    func detailViewShow(model: Model, from view: TableViewProtocol)
}
