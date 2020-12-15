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
    private var backTextView: UIView = UIView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        modelName.text = nil
        modelImage.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(modelImage)
        self.addSubview(backTextView)
        self.addSubview(modelName)
        
        modelImage.contentMode = .scaleAspectFit
        modelImage.layer.borderColor = UIColor.gray.cgColor
        modelImage.layer.borderWidth = 0.5
        modelImage.layer.cornerRadius = 12
        
        backTextView.backgroundColor = .systemGray5
        backTextView.layer.cornerRadius = 12
        
        modelName.font = .systemFont(ofSize: 10, weight: .bold)
        modelName.textAlignment = .center
        
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
        backTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modelImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            modelImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            modelImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            backTextView.topAnchor.constraint(equalTo: modelImage.bottomAnchor, constant: 8),
            backTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backTextView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            modelName.heightAnchor.constraint(equalToConstant: 24),
            modelName.topAnchor.constraint(equalTo: backTextView.topAnchor, constant: 5),
            modelName.leadingAnchor.constraint(equalTo: backTextView.leadingAnchor, constant: 10),
            modelName.trailingAnchor.constraint(equalTo: backTextView.trailingAnchor, constant: -10),
            modelName.bottomAnchor.constraint(equalTo: backTextView.bottomAnchor, constant: -5)
        ])
    }
}
