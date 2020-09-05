//
//  AccountBarButton.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.09.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class AccountBarButton: UIBarButtonItem {

    private var actionHandler: (() -> Void)?
    
    convenience init(image: UIImage?) {
        self.init(image: image, style: .done, target: nil, action: nil)
        self.target = self
        self.action = #selector(barButtontap)
    }
    
    @objc func barButtontap() {
        
    }
}
