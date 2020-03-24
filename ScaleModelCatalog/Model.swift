//
//  Model.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 18.03.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var name: String
    var spec: String
    var image: String
    
    init(name:String,spec:String,image:String) {
        self.name = name
        self.spec = spec
        if (image == "") {
            self.image = "NoImage.png"
        } else {
            self.image = image
        }
    }
    
}
