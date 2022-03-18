//
//  PhotosCollectionViewController.swift
//  UnsplashLibrary_TestApp
//
//  Created by Nechaev Sergey  on 18.03.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }()

    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionButtonPressed))
    }()

    //    private lazy var searchController: UISearchController = {
    //        let searchController = UISearchController(searchResultsController: nil)
    //        sc.searchResultsUpdater = self
    //        sc.delegate = self
    //        searchController.obscuresBackgroundDuringPresentation = false
    //        searchController.searchBar.placeholder = "Enter A Compiny Name Or Symbole"
    //        searchController.searchBar.autocapitalizationType = .allCharacters
    //        return searchController
    //    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()

        setupUI()
    }

    // MARK: - - Setup Navigation Actions

    @objc private func addButtonPressed() {
        print(#function)
    }

    @objc private func actionButtonPressed() {
        print(#function)
    }

    // MARK: - - Setup UI

    private func setupUI() {
        collectionView.backgroundColor = .systemOrange
        setupNavigationBar()
        setupSearchBar()

    }

    private func setupNavigationBar() {
        setupNavigationBarAppearance()
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]

    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    // MARK: - - UICollectionViewDataSource, UICollectionViewDelegate

    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
