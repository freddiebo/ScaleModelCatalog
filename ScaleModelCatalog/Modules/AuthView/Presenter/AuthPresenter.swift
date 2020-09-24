//
//  AuthPresenter.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 28.08.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

class AuthPresenter: BasePresenter {
    weak var view: AuthViewInputProtocol?
    var interactor: AuthInteractorInputProtocol?
    var router: AuthRouterInputProtocol?
    
}
