//
//  DetailViewOutputProtocol.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 20.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewOutputProtocol: class {
    func viewDidLoad()
    func imageViewShow(image: UIImage, from view: DetailViewInputProtocol)
    
    var model: Model? { get }
}
