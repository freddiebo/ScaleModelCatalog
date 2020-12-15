//
//  CollectionViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "reuseIdentifier"
    
    private var bo = true
    private let countOnPage = 3
    private var countPage = 1
    private var lastCell = 0
    var presenter: CollectionViewOutputProtocol?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        configureCollectionView()
        countPage = Int((collectionView.frame.height/150 + 1)) + 1
        
        presenter?.pageViewDidLoad(with: 1, where: countPage * countOnPage)
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        presenter?.models.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = ModelViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ModelViewCell else {
            fatalError("can't reuse ModelViewCell")
        }
        let service = ServerService.shared
        if let model = presenter?.models[indexPath.row] {
            service.getImageModel(with: model.id,
                                  from: model.image) { image in
                                    guard let image = image else { return }
                cell.configureCell(image: image,
                                   nameText: model.name)
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.models[indexPath.row] {
            presenter?.detailViewShow(model: model, from: self)
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        //print("cancel \(indexPaths)")
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
    }
}

extension CollectionViewController {
    private func configureCollectionView() {
//        let nibCell = UINib(nibName: "ModelViewCell",
//                            bundle: nil)
//        self.collectionView?.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(ModelViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        countPage = Int((collectionView.frame.height/150 + 1)) + 1
    }
}
