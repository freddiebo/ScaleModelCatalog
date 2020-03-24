//
//  ViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var models = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddModel))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Model", for: indexPath) as? ModelCell else {
            fatalError("")
        }
        
        let model = models[indexPath.row]
        
        cell.ModelName.text = model.name
        cell.ModelImage.image = UIImage(named: model.image)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailModel") as? DetailViewController {
        
            vc.selectedModel = models[indexPath.row].name
            vc.selectedModelImage = models[indexPath.row].image
            vc.selectedModelSpec = models[indexPath.row].spec
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func AddModel() {
        var text = "Test spec more. "
        for i in 0 ... 10 {
            text.append(text)
        }
        models.append(Model(name: "New model", spec: text, image: "Car.jpg"))
        collectionView.reloadData()
    }
}

