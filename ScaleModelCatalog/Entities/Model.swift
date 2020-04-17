//  Класс для описания модели
//  name - Название модели
//  spec - Описание/спецификация модели
//  name - Фотграфия модели
//
//  Created by  Vladislav Bondarev on 18.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit
struct Model:Codable {
//class Model: Codable {
    let id: String
    let name: String
    let spec: String
    let image: String
    let manufacturer: String
    /*init(id: String, name:String,spec:String,image:String,manufacturer: String) {
        self.id = id
        self.name = name
        self.spec = spec
        self.image = image
        self.manufacturer = manufacturer
    }*/
    
    func loadImage() -> UIImage? {
        var loadedImage = UIImage(named: "NoImage.png")
        if let url = URL(string:self.image) {
            if let data = try? Data(contentsOf: url) {
                loadedImage = UIImage(data: data)
            }
            else {
                let nameImage = id + ".jpg"
                loadedImage = UIImage(named: nameImage)
            }
        }
        return loadedImage
    }
}
