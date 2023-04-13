//
//  CommunitiesCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class CommunitiesCoordinator: Coordinator {
  var navigation: Navigation
  private let factory: CommunitiesFactory
  
  init(navigation: Navigation, factory: CommunitiesFactory) {
    self.navigation = navigation
    self.factory = factory
  }
  
  func start() {
    let controller = factory.makeMyCommunitiesViewController()
    factory.makeItemTabBar(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
  }
}
