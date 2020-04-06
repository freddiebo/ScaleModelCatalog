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
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddModel))

        // Register cell classes
        let nibCell = UINib(nibName: "ModelViewCell", bundle: nil)
        self.collectionView!.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        let urlString = "http://www.mocky.io/v2/5e8747f03100000aff81a520"
            //let urlString = "http://www.mocky.io/v2/5e8746733100008af581a50e"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        collectionView.reloadData()
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ModelViewCell else {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /*;func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 200, height: 200)
    }
    
    @objc func AddModel() {
        var text = "Test spec more. "
        models.append(Model(name: "New model", spec: text, image: "Car.jpg",manufacturer: "None"))
        collectionView.reloadData()
    }
    
}
