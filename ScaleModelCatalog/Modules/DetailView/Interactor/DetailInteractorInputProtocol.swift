//
//  DetailInteractorInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 20.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
