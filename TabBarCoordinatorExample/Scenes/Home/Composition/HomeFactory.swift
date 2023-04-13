//
//  HomeFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol HomeFactory {
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController
  func makeItemTabBar(navigation: Navigation)
  func makePostDetailCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator) -> Coordinator 
}

//TODO: - Move all strings to a constant file
struct HomeFactoryImp: HomeFactory {
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
    
    let controller = HomeViewController(collectionViewLayout: layout, coordinator: coordinator)
    controller.navigationItem.title = "Home 🏠"
    return controller
  }
  
  func makeItemTabBar(navigation: Navigation) {
    makeItemTabBar(
      navigation: navigation,
      title: "Home",
      image: "house",
      selectedImage: "house.fill")
  }
  
  func makePostDetailCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator) -> Coordinator {
    let factory = PostDetailFactory(id: id)
    let coordinator = PostDetailCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
    return coordinator
  }
}

extension HomeFactoryImp: ItemTabBarFactory { }
