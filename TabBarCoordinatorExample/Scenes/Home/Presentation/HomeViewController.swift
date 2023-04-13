//
//  HomeViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol HomeViewControllerCoordinator: AnyObject {
  func didSelectPost(id: Int)
}

//TODO: - Move all strings to a constant file
final class HomeViewController: UICollectionViewController {
  // MARK: - Private properties
  private weak var coordinator: HomeViewControllerCoordinator?
  
  // MARK: - Life Cycle
  init(
    collectionViewLayout: UICollectionViewLayout,
    coordinator: HomeViewControllerCoordinator
  ) {
    self.coordinator = coordinator
    super.init(collectionViewLayout: collectionViewLayout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
    configCollectionView()
  }
  
  // MARK: - Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
  }
  
  private func configCollectionView() {
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
    collectionView.backgroundColor = .systemGroupedBackground
  }
}

// MARK: - Extensions here
extension HomeViewController {
  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
    
    //TODO: Move in the same cell
    var contentConfiguration = UIListContentConfiguration.cell()
    contentConfiguration.text = "Hello"
    contentConfiguration.secondaryText = "there"
    contentConfiguration.image = UIImage(systemName: "photo")
    cell.contentConfiguration = contentConfiguration
    cell.backgroundColor = .systemBackground
    
    return cell
  }
  
  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    10
  }
  
  override func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    coordinator?.didSelectPost(id: indexPath.row)
  }
}

