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
    private let reuseIdentifier = "reuseIdentifier1"
    private let collectionView: UICollectionView = {
        let view = UICollectionView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        presenter?.viewDidLoad()
    }
}
 
// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension FavsViewController: UICollectionViewDataSource, UICollectionViewDelegate {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? FavsViewCell else {
            fatalError("can't reuse ModelViewCell")
        }
        
        cell.config()
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

}
// MARK: - FavsViewControllerInputProtocol
extension FavsViewController: FavsViewControllerInputProtocol {
    func setupView() {
        view.backgroundColor = .systemBackground
    }
}
