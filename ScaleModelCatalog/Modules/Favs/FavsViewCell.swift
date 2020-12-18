//
//  FavsViewCell.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 17.12.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

private let defaultMargin: CGFloat = 10

class FavsViewCell: UICollectionViewCell {
    
    static let height: CGFloat = 80
        
    private let labelWidth = UIScreen.main.bounds.width - 2 * defaultMargin - FavsViewCell.height / 2 - FavsViewCell.height
    
    private var nameString: String = "" {
        didSet {
            nameLabel.text = nameString
            let textHeight = UIFont.systemFont(ofSize: 12,
                                               weight: .bold)
                .calculateHeight(text: nameString,
                                 width: labelWidth)
            
            let maxTextHeight = FavsViewCell.height - 2 * defaultMargin
            
            labelHeight = textHeight > maxTextHeight ? maxTextHeight : textHeight
        }
    }
    
    private var labelHeight: CGFloat = 0
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let favsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = FavsViewCell.height * 0.5 / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = FavsViewCell.height
        
        let imageHeight = cellHeight - defaultMargin
        let imageFrame = CGRect(x: defaultMargin / 2,
                                y: defaultMargin / 2,
                                width: imageHeight,
                                height: imageHeight)
        imageView.frame = imageFrame
        
        let labelFrame = CGRect(x: imageView.frame.maxX + defaultMargin / 2,
                                y: cellHeight / 2 - labelHeight / 2,
                                width: labelWidth,
                                height: labelHeight)
        nameLabel.frame = labelFrame
        
        let favsContainerFrame = CGRect(x: cellWidth - defaultMargin / 2 - cellHeight / 2,
                                        y: cellHeight / 2 - cellHeight / 2 / 2,
                                        width: cellHeight / 2,
                                        height: cellHeight / 2)
        favsContainerView.frame = favsContainerFrame
        
        let heartImageViewFrame = CGRect(x: favsContainerView.frame.width / 2 - favsContainerView.frame.width * 0.75 / 2,
                                         y: favsContainerView.frame.width / 2 - favsContainerView.frame.width * 0.75 / 2,
                                         width: favsContainerView.frame.width * 0.75,
                                         height: favsContainerView.frame.width * 0.75)
        heartImageView.frame = heartImageViewFrame
    }
    
    func config() {
        nameString = "Ffdsjksdf"
        layoutIfNeeded()
    }
}

//MARK: - private method
extension FavsViewCell {
    private func setupView() {
        configureHierarchy()
//        configurateConstrain()
    }
    
    private func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favsContainerView)
        favsContainerView.addSubview(heartImageView)
    }
    
    private func configurateConstrain() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultMargin),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -defaultMargin),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultMargin),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -2 * defaultMargin),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultMargin),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -defaultMargin),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -defaultMargin),
            
            favsContainerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favsContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultMargin),
            favsContainerView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: defaultMargin),
            favsContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            favsContainerView.widthAnchor.constraint(equalTo: favsContainerView.heightAnchor),
            
            heartImageView.centerYAnchor.constraint(equalTo: favsContainerView.centerYAnchor),
            heartImageView.centerXAnchor.constraint(equalTo: favsContainerView.centerXAnchor),
            heartImageView.heightAnchor.constraint(equalTo: favsContainerView.widthAnchor, multiplier: 0.75),
            heartImageView.widthAnchor.constraint(equalTo: heartImageView.heightAnchor)
        ])
    }
}
