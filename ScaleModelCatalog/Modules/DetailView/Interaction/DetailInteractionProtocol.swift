//
//  DetailInteractionProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol DetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
