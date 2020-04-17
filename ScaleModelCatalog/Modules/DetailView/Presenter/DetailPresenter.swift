//
//  DetailPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    func viewDidLoad() {
        view?.loadInterface()
    }
    
    func imageViewShow(image: UIImage, from view: DetailViewProtocol) {
        router?.presentImageView(for: image, from: view)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {

}
