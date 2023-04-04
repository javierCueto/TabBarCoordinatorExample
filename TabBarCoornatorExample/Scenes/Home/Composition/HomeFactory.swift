//
//  HomeFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol HomeFactory {
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController
  func makeItemTabBar(navigation: UINavigationController)
  func makePostDetailCoordinator(navigation: UINavigationController, id: Int) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
    
    let controller = HomeViewController(collectionViewLayout: layout, coordinator: coordinator)
    controller.navigationItem.title = "Home 🏠"
    return controller
  }
  
  func makeItemTabBar(navigation: UINavigationController) {
    makeItemTabBar(
      navigation: navigation,
      title: "Home",
      image: "house",
      selectedImage: "house.fill")
  }
  
  func makePostDetailCoordinator(navigation: UINavigationController, id: Int) -> Coordinator {
    let factory = PostDetailFactory(id: id)
    let coordinator = PostDetailCoordinator(navigation: navigation, factory: factory)
    return coordinator
  }
}

extension HomeFactoryImp: ItemTabBarFactory { }
