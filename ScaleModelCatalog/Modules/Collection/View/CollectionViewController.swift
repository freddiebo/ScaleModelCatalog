//
//  CollectionViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    private let reuseIdentifier = "reuseIdentifier"
    
    private let spinner = UIActivityIndicatorView()
    private var bo = true
    private let countOnPage = 3
    private var countPage = 1
    private var lastCell = 0
    var presenter: CollectionViewOutputProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        spinnerSetting()
        
        configureCollectionView()
        countPage = Int((collectionView.frame.height/150 + 1)) + 1
        
        presenter?.pageViewDidLoad(with: 1, where: countPage * countOnPage)
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        presenter?.models.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? ModelViewCell else {
            fatalError("can't reuse ModelViewCell")
        }
        let service = ServerService.shared
        if let model = presenter?.models[indexPath.row] {
            service.getImageModel(with: model.id,
                                  from: model.image) { image in
                                    guard let image = image else { return }
                cell.configureCell(image: image,
                                   nameText: model.name,
                                   modelId: model.id)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.models[indexPath.row] {
            
            let favsDef = FavoriteService.shared
            favsDef.saveInFavs(model: model)
            let mod = favsDef.getFavsModel(for: model.id)
            
            presenter?.detailViewShow(model: model, from: self)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

// MARK: - UICollectionViewDataSourcePrefetching
extension CollectionViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView,
                        prefetchItemsAt indexPaths: [IndexPath]) {
        guard let lastIndexPath = indexPaths.last else { return }
        if lastCell < lastIndexPath.row {
            lastCell = lastIndexPath.row
            countPage += 1
            presenter?.pageViewDidLoad(with: countPage, where: countOnPage)
        }
      }
    
    func collectionView(_ collectionView: UICollectionView,
                        cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = Int(screenWidth) / countOnPage - 10
        return CGSize(width: width,
                      height: 150)
    }
}

// MARK: - CollectionViewInputProtocol
extension CollectionViewController: CollectionViewInputProtocol {
    func reloadInterface() {
        collectionView.reloadData()
        spinner.stopAnimating()
    }
}

// MARK: - private method
extension CollectionViewController {
    private func configureCollectionView() {
        collectionView.register(ModelViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        countPage = Int((collectionView.frame.height/150 + 1)) + 1
    }
    
    private func spinnerSetting() {
        spinner.color = .darkGray
        spinner.style = .large
        spinner.startAnimating()
        
        view.addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
