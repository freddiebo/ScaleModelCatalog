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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddModel))
        
        let urlString = "http://www.mocky.io/v2/5e81fad52f00000d002fb782"
        //let urlString = "http://www.mocky.io/v2/5e81cb6d2f00000d002fb593"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonModels = try? decoder.decode(Models.self, from: json) {
            models = jsonModels.Body
            collectionView.reloadData()
        }
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
        /*let url = URL(string:model.image)
        if let data = try? Data(contentsOf: url!)
        {
            cell.ModelImage.image = UIImage(data: data)
        }*/
        cell.ModelImage.image = model.loadImage()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        if let vc = storyboard?.instantiateViewController(identifier: "DetailModel") as? DetailViewController {
        
            vc.selectedModel = models[indexPath.row].name
            vc.selectedModelImage = models[indexPath.row].loadImage()
            vc.selectedModelSpec = models[indexPath.row].spec
            navigationController?.pushViewController(vc, animated: true)
        }*/
        let vc = DetailViewController()
        vc.selectedModel = models[indexPath.row].name
        vc.selectedModelImage = models[indexPath.row].loadImage()
        vc.selectedModelSpec = models[indexPath.row].spec
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // добавление модели в список (пока заглушка)
    @objc func AddModel() {
        var text = "Test spec more. "
        models.append(Model(name: "New model", spec: text, image: "Car.jpg"))
        collectionView.reloadData()
    }
    
    func loadImage(for urlString:String) -> UIImage? {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url)
            {
                return UIImage(data: data)
            }
        }
        return UIImage(contentsOfFile: "NoImage.png")
    }
}

