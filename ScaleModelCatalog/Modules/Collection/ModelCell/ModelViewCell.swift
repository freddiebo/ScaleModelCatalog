//
//  ModelViewCell.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ModelViewCell: UICollectionViewCell {

    private var modelImage: UIImageView = UIImageView()
    private var modelName: UILabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        modelName.text = nil
        modelImage.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(modelName)
        self.addSubview(modelImage)
        modelImage.contentMode = .scaleAspectFit
        modelName.font = .systemFont(ofSize: 14, weight: .bold)
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(image: UIImage,
                       nameText: String) {
        modelImage.image = image
        modelName.text = nameText
    }
    
    private func configureContraints() {
        modelImage.translatesAutoresizingMaskIntoConstraints = false
        modelName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modelImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            modelImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            modelImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            modelName.heightAnchor.constraint(equalToConstant: 24),
            modelName.topAnchor.constraint(equalTo: modelImage.bottomAnchor, constant: 8),
            modelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            modelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            modelName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
