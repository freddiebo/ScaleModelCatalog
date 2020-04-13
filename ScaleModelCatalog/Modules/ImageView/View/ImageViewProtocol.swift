//
//  ImageViewControllerProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol ImageViewProtocol: class {
    var presenter: ImagePresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func loadInterface()
}
