//
//  DetailPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 12.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation
import UIKit

//class DetailPresenter: DetailPresenterProtocol {
class DetailPresenter: BasePresenter {
    weak var view: DetailViewInputProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterInputProtocol?
    /*
    func viewDidLoad() {
        view?.loadInterface()
    }
    
    func imageViewShow(image: UIImage, from view: DetailViewProtocol) {
        router?.presentImageView(for: image, from: view)
    }*/
}

// MARK: - DetailViewOutputProtocol
extension DetailPresenter: DetailViewOutputProtocol {
    func viewDidLoad() {
        view?.loadInterface()
    }
    
    func imageViewShow(image: UIImage, from view: DetailViewInputProtocol) {
        router?.presentImageView(for: image, from: view)
    }
}

// MARK: - DetailModuleInputProtocol
extension DetailPresenter: DetailModuleInputProtocol {

}

// MARK: - DetailInteractorOutputProtocol
extension DetailPresenter: DetailInteractorOutputProtocol {

}

// MARK: - DetailRouterOutputProtocol
extension DetailPresenter: DetailRouterOutputProtocol {

}
