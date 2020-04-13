//
//  CollectionRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 09.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol CollectionPresenterProtocol: class {
    var view: CollectionViewProtocol? { get set }
    var interactor: CollectionInteractorInputProtocol? { get set }
    var router: CollectionRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad() // инициализация и конфигурирование первоначальных данных для view
    func detailViewShow(model: Model, from view: CollectionViewProtocol)
}
