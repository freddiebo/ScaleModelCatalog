//
//  ImagePresenterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePresenterProtocol: class {
    var view: ImageViewProtocol? { get set }
    var interactor: ImageInteractorInputProtocol? { get set }
    var router: ImageRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad() // инициализация и конфигурирование первоначальных данных для view
}
