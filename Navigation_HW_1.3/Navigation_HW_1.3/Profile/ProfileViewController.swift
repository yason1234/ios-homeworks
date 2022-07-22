//
//  ProfileViewController.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 08.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //profileHeaderView.avatarImageView.layer.cornerRadius = profileHeaderView.avatarImageView.frame.width / 2
    }
        
    private func setupViews() {
        
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ProfileViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 350)])
    }
}
