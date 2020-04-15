//
//  ImagePresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter: ImagePresenterProtocol {
    weak var view: ImageViewProtocol?
    var interactor: ImageInteractorInputProtocol?
    var router: ImageRouterProtocol?
    
    func viewDidLoad() {
        view?.loadInterface()
    }
}

extension ImagePresenter: ImageInteractorOutputProtocol {

}
