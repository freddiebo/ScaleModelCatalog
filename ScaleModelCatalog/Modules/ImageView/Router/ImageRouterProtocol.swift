//
//  ImageViewRouterProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol ImageRouterProtocol: class {
    static func createImageViewModule(for image: UIImage) -> UIViewController

    // PRESENTER -> ROUTER
}
