//
//  ModelViewCellDelegate.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 18.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

protocol ModelViewCellDelegate: AnyObject {
    func didTapOnFavButton(with index: String)
}
