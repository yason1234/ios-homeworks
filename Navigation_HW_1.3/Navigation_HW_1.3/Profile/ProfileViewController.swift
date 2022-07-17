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
        profileHeaderView.allFunc()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = view.frame
    }
    
    private func setupViews() {
        
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
}
