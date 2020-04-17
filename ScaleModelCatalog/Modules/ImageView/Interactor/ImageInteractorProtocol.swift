//
//  ImageInteractionProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol ImageInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol ImageInteractorInputProtocol: class {
    var presenter: ImageInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
