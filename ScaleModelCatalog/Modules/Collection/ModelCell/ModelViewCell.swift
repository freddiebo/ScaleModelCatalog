//
//  ModelViewCell.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 02.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ModelViewCell: UICollectionViewCell {

    private let modelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private let favImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let favImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    private var modelName: UILabel = UILabel()
    private var backTextView: UIView = UIView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        modelName.text = nil
        modelImage.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(modelImage)
        modelImage.addSubview(favImageContainerView)
        favImageContainerView.addSubview(favImageView)
        contentView.addSubview(backTextView)
        backTextView.addSubview(modelName)
                
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
        let isItemFav = true
        modelImage.image = image
        modelName.text = nameText
        favImageView.tintColor = isItemFav ? .systemRed : .white
    }
    
    private func configureContraints() {
        modelName.translatesAutoresizingMaskIntoConstraints = false
        backTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modelImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            modelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            modelImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            modelImage.heightAnchor.constraint(equalTo: modelImage.widthAnchor),
            
            favImageContainerView.topAnchor.constraint(equalTo: modelImage.topAnchor),
            favImageContainerView.trailingAnchor.constraint(equalTo: modelImage.trailingAnchor),
            favImageContainerView.heightAnchor.constraint(equalTo: modelImage.widthAnchor, multiplier: 0.25),
            favImageContainerView.widthAnchor.constraint(equalTo: favImageContainerView.heightAnchor),
            
            favImageView.centerYAnchor.constraint(equalTo: favImageContainerView.centerYAnchor),
            favImageView.centerXAnchor.constraint(equalTo: favImageContainerView.centerXAnchor),
            favImageView.widthAnchor.constraint(equalTo: favImageContainerView.widthAnchor, multiplier: 0.75),
            favImageView.heightAnchor.constraint(equalTo: favImageView.widthAnchor),

            backTextView.topAnchor.constraint(equalTo: modelImage.bottomAnchor, constant: 8),
            backTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            modelName.topAnchor.constraint(equalTo: backTextView.topAnchor, constant: 5),
            modelName.leadingAnchor.constraint(equalTo: backTextView.leadingAnchor, constant: 10),
            modelName.trailingAnchor.constraint(equalTo: backTextView.trailingAnchor, constant: -10),
            modelName.bottomAnchor.constraint(equalTo: backTextView.bottomAnchor, constant: -5)
        ])
    }
}
