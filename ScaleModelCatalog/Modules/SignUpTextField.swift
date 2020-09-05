//
//  SignUpTextField.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 03.09.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class SignUpTextField: UITextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4.0
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setWrongFiled() {
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func resetField() {
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
