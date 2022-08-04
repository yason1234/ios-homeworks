//
//  PhotosTableViewCell.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 03.08.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photoLabel = UILabel()
    private lazy var layout = UICollectionViewFlowLayout()
    private lazy var photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private lazy var container = UIView()
    var arrayOfImage: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        configure()
        setConstraints()
       
        layout.scrollDirection = .horizontal
        photosCollectionView.register(myCollectionCell.self, forCellWithReuseIdentifier: "cell")
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
       // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        self.contentView.addSubview(photoLabel)
        container.addSubview(photosCollectionView)
        self.contentView.addSubview(container)
    }
    
    private func configure() {
        
        // label
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.text = "Photos"
        photoLabel.textColor = .black
        photoLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        // collection
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView.clipsToBounds = true
        
        // container
        container.translatesAutoresizingMaskIntoConstraints = false
    }
   
}

extension PhotosTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            container.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            container.heightAnchor.constraint(equalToConstant: self.frame.width / 4),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            photosCollectionView.topAnchor.constraint(equalTo: container.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionCell
        cell.setImage(name: arrayOfImage[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: container.frame.width / 4, height: container.frame.height)
    }
}
