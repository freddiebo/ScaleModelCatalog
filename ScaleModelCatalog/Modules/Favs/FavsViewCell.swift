//
//  FavsViewCell.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class FavsViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let favsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = view.frame.size.width / 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favsContainerView)

        
        configurateConstrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        nameLabel.text = "text"
    }
}

//MARK: - private method
extension FavsViewCell {
    private func configurateConstrain() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            favsContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            favsContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            favsContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favsContainerView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            favsContainerView.heightAnchor.constraint(equalTo: favsContainerView.widthAnchor)
        ])
    }
}
