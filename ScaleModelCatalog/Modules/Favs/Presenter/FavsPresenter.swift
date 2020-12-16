//
//  FavsPresenter.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

class FavsPresenter: BasePresenter {
    weak var view: FavsViewControllerInputProtocol?
    var interactor: FavsInteractorInputProtocol?
    var router: FavsRouterInputProtocol?
}

// MARK: - FavsViewControllerOutputProtocol
extension FavsPresenter: FavsViewControllerOutputProtocol {
    func viewDidLoad() {
        view?.setupView()
    }
}

// MARK: - FavsInteractorOutputProtocol
extension FavsPresenter: FavsInteractorOutputProtocol {
    
}

// MARK: - FavsRouterOutputProtocol
extension FavsPresenter: FavsRouterOutputProtocol {
    
}
