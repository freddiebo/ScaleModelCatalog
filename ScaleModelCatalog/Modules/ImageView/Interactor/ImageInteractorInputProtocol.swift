//
//  ImageInteractorInputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

protocol ImageInteractorInputProtocol: class {
    var presenter: ImageInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
