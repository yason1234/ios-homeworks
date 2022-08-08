//
//  PhotoCollectionCell.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 06.08.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var photoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.addSubview(photoImage)
        photoImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(name: String) {
        
        photoImage.image = UIImage(named: name)
    }
}

extension PhotosCollectionViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
