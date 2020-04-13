//
//  CollectionViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Model"

class CollectionViewController: UICollectionViewController,CollectionViewProtocol {
    
    var modelList = [Model]()
    var presenter: CollectionPresenterProtocol?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddModel))

        // Register cell classes
        let nibCell = UINib(nibName: "ModelViewCell", bundle: nil)
        self.collectionView!.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ModelViewCell else {
            fatalError("")
        }
        
        let model = modelList[indexPath.row]
        
        cell.ModelName.text = model.name
        cell.ModelImage.image = model.loadImage()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.detailViewShow(model: modelList[indexPath.row], from: self)
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 200, height: 200)
    }
    
    /*@objc func AddModel() {
        let text = "Test spec more. "
        modelList.append(Model(id:"", name: "New model", spec: text, image: "Car.jpg",manufacturer: "None"))
        collectionView.reloadData()
    }*/
    
    func reloadInterface(with models: [Model]) {
        modelList = models
        collectionView.reloadData()
    }
    
}
