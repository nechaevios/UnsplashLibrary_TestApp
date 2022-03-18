//
//  MainTabBarController.swift
//  UnsplashLibrary_TestApp
//
//  Created by Nechaev Sergey  on 18.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabBarControllers()

    }

    private func setupUI() {
        tabBar.barTintColor = .blue
        tabBar.backgroundColor = .white
    }

    private func setupTabBarControllers() {
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let favoriteVC = FavoriteViewController()

        viewControllers = [
            generateNavigationController(rootVC: photosVC, title: "Photos", imageName: "photo"),
            generateNavigationController(rootVC: favoriteVC, title: "Favorites", imageName: "suit.heart.fill")
        ]
    }

    private func generateNavigationController(rootVC: UIViewController, title: String, imageName: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = UIImage(systemName: imageName)
        return navigationVC
    }
}
