//
//  DetailPresenterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()// инициализация и конфигурирование первоначальных данных для view
    func addTap(for imageView: UIImageView)
}
