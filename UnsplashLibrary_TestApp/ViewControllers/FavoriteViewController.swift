//
//  FavoriteViewController.swift
//  UnsplashLibrary_TestApp
//
//  Created by Nechaev Sergey  on 18.03.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        setupNavigationBar()

    }

    private func setupNavigationBar() {
        setupNavigationBarAppearance()
        let titleLabel = UILabel()
        titleLabel.text = "FAVORITES"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
//        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]

    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}
