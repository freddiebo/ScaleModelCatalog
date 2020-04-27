//
//  ImageRouter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 27.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ImageRouter: BaseRouter {
    weak var presenter: ImageViewOutputProtocol!
}

// MARK: - DetailRouterInputProtocol
extension ImageRouter: ImageRouterInputProtocol {

}
