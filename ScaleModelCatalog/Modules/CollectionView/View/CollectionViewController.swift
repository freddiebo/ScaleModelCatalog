//
//  CollectionViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Model"

class CollectionViewController: UICollectionViewController {
    var bo = true
    let countOnPage = 3
    var countPage = 1
    var lastCell = 0
    var modelList = [Model]()
    var presenter: CollectionViewOutputProtocol!
 
    override func viewDidLoad() {

        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        countPage = Int((collectionView.frame.height/150 + 1)) + 1
        //presenter.viewDidLoad()
        presenter.pageViewDidLoad(with: 1, where: countPage * countOnPage)


        // Register cell classes
        let nibCell = UINib(nibName: "ModelViewCell", bundle: nil)
        self.collectionView?.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ModelViewCell else {
            fatalError("")
        }
        let model = modelList[indexPath.row]
        
        cell.modelName.text = model.name
        let service = ServerService.shared
        service.getImageModel(with: model.id, from: model.image, completion: { image in
            cell.modelImage.image = image
        })
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.detailViewShow(model: modelList[indexPath.row], from: self)
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDataSourcePrefetching
extension CollectionViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let indexPath = indexPaths.last
        if lastCell < indexPath!.row {
            lastCell = indexPath!.row
            countPage += 1
            presenter.pageViewDidLoad(with: countPage, where: countOnPage)
        }
      }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        //print("cancel \(indexPaths)")
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = collectionView.visibleSize.width
        let width = Int(screenSize)/countOnPage - 10
        return CGSize.init(width: width, height: 150)
    }
}


// MARK: - CollectionViewInputProtocol
extension CollectionViewController: CollectionViewInputProtocol {
    func reloadInterface(with models: [Model]) {
        modelList = models
        collectionView.reloadData()
    }
}
