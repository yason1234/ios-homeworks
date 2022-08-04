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
    private lazy var image = ["logo", "jordan", "wwdc", "bmw", "harward", "logo", "logo", "jordan", "wwdc", "bmw", "harward", "logo"]

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
        myTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "collection")
    }
}

// MARK: tableView Data and Delegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return model.count
        default: break
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! PostTableViewCell
            cell.configureViews(authorNew: model[indexPath.row].author, avatar: model[indexPath.row].image, description: model[indexPath.row].description, likes: model[indexPath.row].likes, views: model[indexPath.row].views)
            return cell
        } else if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "collection", for: indexPath) as! PhotosTableViewCell
            cell.arrayOfImage = image
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! ProfileHeaderView
            header.delegate = self
            header.setDelegate()
            return header
        }
        return nil
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 200
//        } else {
//            return sizeForSection2[indexPath.row]
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let newVC = CollectionViewController()
            navigationController?.pushViewController(newVC, animated: true)
        }
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
