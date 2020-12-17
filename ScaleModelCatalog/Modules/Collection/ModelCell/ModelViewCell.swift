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
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let favImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    private var modelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private var backContentLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 12
        return view
    }()
    
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
        contentView.addSubview(backContentLabelView)
        backContentLabelView.addSubview(modelName)
        
        modelImage.isUserInteractionEnabled = true
        favImageContainerView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(tapToFavs))
        favImageContainerView.isUserInteractionEnabled = true
        favImageContainerView.addGestureRecognizer(tapGestureRecognizer)
        
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(image: UIImage,
                       nameText: String,
                       isItemFav: Bool) {
        modelImage.image = image
        modelName.text = nameText
        favImageView.tintColor = isItemFav ? .systemRed : .white
    }
}

// MARK: - private method
extension ModelViewCell {
    private func configureContraints() {
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

            backContentLabelView.topAnchor.constraint(equalTo: modelImage.bottomAnchor, constant: 8),
            backContentLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backContentLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backContentLabelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            modelName.topAnchor.constraint(equalTo: backContentLabelView.topAnchor, constant: 5),
            modelName.leadingAnchor.constraint(equalTo: backContentLabelView.leadingAnchor, constant: 10),
            modelName.trailingAnchor.constraint(equalTo: backContentLabelView.trailingAnchor, constant: -10),
            modelName.bottomAnchor.constraint(equalTo: backContentLabelView.bottomAnchor, constant: -5)
        ])
    }
    
    @objc
    private func tapToFavs() {
        print("tap like")
    }
}
