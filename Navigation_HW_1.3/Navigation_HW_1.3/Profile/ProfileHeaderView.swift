//
//  ProfileHeaderView.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 12.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarUiImageView = UIImageView()
    private lazy var headLabel = UILabel()
    private lazy var statusLabel = UILabel()
    private lazy var statusButton = UIButton()
    private lazy var statusTextField = UITextField()
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func allFunc() {
        
        setupViews()
        setConstraints()
        configureViews()
        actionStatusButton()
        statusTexfFieldAction()
    }

     func setupViews() {

         addSubview(avatarUiImageView)
         addSubview(headLabel)
         addSubview(statusLabel)
         addSubview(statusButton)
         addSubview(statusTextField)
    }
    
     func configureViews() {
        
        // UIimage
         avatarUiImageView.image = UIImage(named: "Michel_Muller")
         avatarUiImageView.clipsToBounds = true
         avatarUiImageView.layer.borderWidth = 3
         avatarUiImageView.layer.cornerRadius = 45
         avatarUiImageView.layer.borderColor = UIColor.white.cgColor
         avatarUiImageView.backgroundColor = .lightGray
         avatarUiImageView.translatesAutoresizingMaskIntoConstraints = false
            
            // headLabel
         headLabel.font = .systemFont(ofSize: 18, weight: .bold)
         headLabel.textColor = .black
         headLabel.text = "Momo"
         headLabel.textAlignment = .center
         headLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // statusLabel
         statusLabel.text = "Waiting for something..."
         statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
         statusLabel.textColor = .gray
         statusLabel.textAlignment = .center
         statusLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // statusButton
         statusButton.setTitle("Show status", for: .normal)
         statusButton.backgroundColor = .systemBlue
         statusButton.tintColor = .white
         statusButton.layer.cornerRadius = 15
         statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
         statusButton.layer.shadowRadius = 4
         statusButton.layer.shadowColor = UIColor.black.cgColor
         statusButton.layer.shadowOpacity = 0.7
         statusButton.translatesAutoresizingMaskIntoConstraints = false
         
            // status textField
         statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
         statusTextField.textColor = .black
         statusTextField.layer.borderWidth = 1
         statusTextField.layer.cornerRadius = 12
         statusTextField.layer.borderColor = UIColor.black.cgColor
         statusTextField.backgroundColor = .white
         statusTextField.translatesAutoresizingMaskIntoConstraints = false
         statusTextField.clipsToBounds = true
         statusTextField.textAlignment = .natural
         statusTextField.borderStyle = .roundedRect
    }
}

extension ProfileHeaderView {

     func setConstraints() {

        NSLayoutConstraint.activate([
            self.avatarUiImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatarUiImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarUiImageView.widthAnchor.constraint(equalToConstant: 90),
            self.avatarUiImageView.heightAnchor.constraint(equalToConstant: 90)])
         
         NSLayoutConstraint.activate([
             self.headLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
             self.headLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             self.headLabel.widthAnchor.constraint(equalToConstant: 180),
             self.headLabel.heightAnchor.constraint(equalToConstant: 30)])
         
         NSLayoutConstraint.activate([
             self.statusLabel.bottomAnchor.constraint(equalTo: self.avatarUiImageView.bottomAnchor, constant: -18),
             self.statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             self.statusLabel.widthAnchor.constraint(equalToConstant: 160),
             self.statusLabel.heightAnchor.constraint(equalToConstant: 15)])

         NSLayoutConstraint.activate([
            self.statusButton.topAnchor.constraint(equalTo: self.avatarUiImageView.bottomAnchor, constant: 32),
            self.statusButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.statusButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)])
         
         NSLayoutConstraint.activate([
            self.statusTextField.bottomAnchor.constraint(equalTo: self.avatarUiImageView.bottomAnchor, constant: 25),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.statusButton.trailingAnchor),
            self.statusTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor, constant: 100),
            self.statusTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40)])
    }
}

// button action

extension ProfileHeaderView {
    
    func actionStatusButton() {
        
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        
        statusLabel.text = statusText
    }
    
    func statusTexfFieldAction() {
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    @objc func statusTextChanged() {
        
        statusText = statusTextField.text
    }
}


