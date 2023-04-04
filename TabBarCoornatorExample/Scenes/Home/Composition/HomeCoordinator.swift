//
//  HomeCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
  var navigation: UINavigationController
  private let factory: HomeFactory
  private var postDetailCoordinator: Coordinator?
  
  init(navigation: UINavigationController, factory: HomeFactory) {
    self.navigation = navigation
    self.factory = factory
  }
  
  func start() {
    let controller = factory.makeHomeViewController(coordinator: self)
    factory.makeItemTabBar(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
  }
  
  
}

extension HomeCoordinator: HomeViewControllerCoordinator {
  func didSelectPost(id: Int) {
    postDetailCoordinator = factory.makePostDetailCoordinator(navigation: navigation, id: id)
    postDetailCoordinator?.start()
  }

}
