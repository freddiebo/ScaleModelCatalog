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
        countPage = Int((collectionView.frame.height/150 + 1)/3) + 1
        
        print(countPage)
        //presenter.viewDidLoad()
        presenter.pageViewDidLoad(with: 1, where: countPage*9)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddModel))

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
        model.getModels{ image in
            cell.modelImage.image = image
        }
        /*model.load() { image in
            cell.modelImage.image = image
        }*/
        //cell.modelImage.image = model.loadImage()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.detailViewShow(model: modelList[indexPath.row], from: self)
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /*@objc func AddModel() {
        let text = "Test spec more. "
        modelList.append(Model(id:"", name: "New model", spec: text, image: "Car.jpg",manufacturer: "None"))
        collectionView.reloadData()
    }*/
}

// MARK: - UICollectionViewDataSourcePrefetching
extension CollectionViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print("Vis \(indexPaths)")
        let indexPath = indexPaths.last
        print(indexPath!.section)
        print(indexPath!.row)
        print(lastCell)
        if lastCell < indexPath!.row {
            lastCell = indexPath!.row
            print(indexPath!.count/9)
            countPage += 1
            //while bo {
                //bo = false
                presenter.pageViewDidLoad(with: countPage, where: 9)
                //modelList.append(modelList[0])
                //let newIndexPath = IndexPath(row: indexPath!.row, section: indexPath!.section)
                //collectionView.insertItems(at: [newIndexPath])
                //collectionView.reloadItems(at: [newIndexPath])
            //}
        }
      }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("cancel \(indexPaths)")
    }
    
    func insertCellModel() {
        let newIndexPath = IndexPath(row: lastCell, section: 0)
        collectionView.insertItems(at: [newIndexPath,newIndexPath,newIndexPath])
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = collectionView.visibleSize.width
        let width = Int(screenSize)/countOnPage - 10
        //print("count width \(round(screenSize/width))")
        //print("count height \(round(collectionView.frame.height/150))")
        return CGSize.init(width: width, height: 150)
    }
}


// MARK: - CollectionViewInputProtocol
extension CollectionViewController: CollectionViewInputProtocol {
    func reloadInterface(with models: [Model]) {
        if modelList.count == 0 {
            modelList = models
            collectionView.reloadData()
        } else {
            modelList = models
            insertCellModel()
        }
    }
}
