//
//  DetailRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol DetailRouterProtocol: class {
    static func createDetailViewModule(for model: Model) -> UIViewController

    // PRESENTER -> ROUTER
    func presentImageView(for image: UIImage, from view: DetailViewProtocol)
}
