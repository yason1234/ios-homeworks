//
//  FeedViewController.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 08.07.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var buttonPost = ButtonFeed()
    var post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraint()
        buttonPress()
        self.tabBarController?.hidesBottomBarWhenPushed = true

    }
    
// MARK: setup
    private func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(buttonPost)
    }
}

// MARK: buttonPress
extension FeedViewController {
    
    private func buttonPress() {
        
        buttonPost.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
    }
    
    @objc private func pushVC() {
        
        let newVC = PostViewController()
        navigationController?.pushViewController(newVC, animated: true)
        newVC.title = post.title
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
}

// MARK: constraints
extension FeedViewController {
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            buttonPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPost.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            buttonPost.widthAnchor.constraint(equalToConstant: 100),
            buttonPost.heightAnchor.constraint(equalToConstant: 50)])
    }
}

