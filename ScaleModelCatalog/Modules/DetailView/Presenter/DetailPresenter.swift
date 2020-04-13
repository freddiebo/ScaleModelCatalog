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
    
    func addTap(for imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        router?.presentImageView(for: tappedImage.image!, from: view!)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {

}
