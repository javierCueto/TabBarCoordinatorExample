//
//  HomeCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
  var navigation: Navigation
  var childCoordinators: [Coordinator] = []
  private let factory: HomeFactory
  
  init(navigation: Navigation, factory: HomeFactory) {
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

//TODO: - Move to another file
extension HomeCoordinator: HomeViewControllerCoordinator {
  func didSelectPost(id: Int) {
    let postDetailCoordinator = factory.makePostDetailCoordinator(navigation: navigation, id: id, parentCoordinator: self)
   addChildCoordinatorStar(postDetailCoordinator)
  }
}

extension HomeCoordinator: ParentCoordinator { }
