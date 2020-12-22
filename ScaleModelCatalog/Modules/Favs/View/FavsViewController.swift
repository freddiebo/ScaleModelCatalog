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
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                     height: FavsViewCell.height)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter?.viewDidLoad()
    }
}
 
// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension FavsViewController: UICollectionViewDataSource, UICollectionViewDelegate {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.favsModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? FavsViewCell else {
            fatalError("can't reuse ModelViewCell")
        }
        if let model = presenter?.favsModels[indexPath.row] {
            cell.config(modelId: model.id, modelName: model.name, modelImageName: model.image, isInFavs: model.isInFavs)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

}
// MARK: - FavsViewControllerInputProtocol
extension FavsViewController: FavsViewControllerInputProtocol {
    func setupView() {
        collectionView.register(FavsViewCell.self,
                                forCellWithReuseIdentifier: reuseIdentifier)
        
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func reloadInterface() {
        collectionView.reloadData()
    }
}
