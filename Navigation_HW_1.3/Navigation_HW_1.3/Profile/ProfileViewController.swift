//
//  ProfileViewController.swift
//  Navigation_HW_1.3
//
//  Created by Dima Shikhalev on 08.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var myTableView = UITableView(frame: .zero, style: .grouped)
    private lazy var model: [NewPost] = postArray

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        configure()
        setConstraints()
    }

    private func setUpViews() {

        view.addSubview(myTableView)
    }

    private func configure() {

        view.backgroundColor = .white
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = .white
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "customCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
}

// MARK: tableView Data and Delegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! PostTableViewCell
        cell.configureViews(authorNew: model[indexPath.row].author, avatar: model[indexPath.row].image, description: model[indexPath.row].description, likes: model[indexPath.row].likes, views: model[indexPath.row].views)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! ProfileHeaderView
        header.delegate = self
        header.setDelegate()
        return header
    }
}

// MARK: constraints
extension ProfileViewController {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}






//    private lazy var profileHeaderView = ProfileHeaderView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupViews()
//        setConstraints()
//    }
//
//    private func setupViews() {
//
//        view.backgroundColor = .lightGray
//        view.addSubview(profileHeaderView)
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        profileHeaderView.layer.borderWidth = 3
//        profileHeaderView.layer.borderColor = UIColor.systemBlue.cgColor
//    }
//}
//
//extension ProfileViewController {
//
//    private func setConstraints() {
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)])
//    }
//}
