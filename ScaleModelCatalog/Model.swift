//  Класс для описания модели
//  name - Название модели
//  spec - Описание/спецификация модели
//  name - Фотграфия модели
//
//  Created by  Vladislav Bondarev on 18.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class Model: NSObject, Codable {
    
    var name: String
    var spec: String
    var image: String
    
    init(name:String,spec:String,image:String) {
        self.name = name
        self.spec = spec
        self.image = image
    }
    
    func loadImage() -> UIImage? {
        if let url = URL(string:self.image) {
            if let data = try? Data(contentsOf: url)
            {
                return UIImage(data: data)
            }
        }
        return UIImage(contentsOfFile: "NoImage.png")
    }
}
