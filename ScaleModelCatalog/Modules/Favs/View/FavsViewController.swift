//
//  FavsViewController.swift
//  ScaleModelCatalog
//
//  Created by Александров Роман Витальевич on 16.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class FavsViewController: UIViewController {
    var presenter: FavsViewControllerOutputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
 
// MARK: - FavsViewControllerInputProtocol
extension FavsViewController: FavsViewControllerInputProtocol {
    func setupView() {
        view.backgroundColor = .systemBackground
    }
}
