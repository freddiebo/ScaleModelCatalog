//
//  ImagePresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 13.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//
import UIKit

class ImagePresenter: BasePresenter {
    weak var view: ImageViewInputProtocol?
    var interactor: ImageInteractorInputProtocol?
    var router: ImageRouterInputProtocol?
    
    private(set) var image: UIImage?
}

// MARK: - ImageViewOutputProtocol
extension ImagePresenter: ImageViewOutputProtocol {
    
    func viewDidLoad() {
        view?.loadInterface()
    }
    
}

// MARK: - ImageModuleInputProtocol
extension ImagePresenter: ImageModuleInputProtocol {
    func setImage(_ image: UIImage) {
        self.image = image
    }
    

}

// MARK: - ImageInteractorOutputProtocol
extension ImagePresenter: ImageInteractorOutputProtocol {

}

// MARK: - ImageRouterOutputProtocol
extension ImagePresenter: ImageRouterOutputProtocol {

}

