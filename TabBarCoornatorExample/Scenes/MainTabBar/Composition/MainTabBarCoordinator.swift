//
//  MainTabBarCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
  func didFinish()
}

final class MainTabBarCoordinator: Coordinator {
  var navigation: Navigation
  private let factory: MainTabBarFactory
  private weak var delegate: MainTabBarCoordinatorDelegate?
  var childCoordinators: [Coordinator] = []
  
  init(
    navigation: Navigation,
    factory: MainTabBarFactory,
    delegate: MainTabBarCoordinatorDelegate
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }
  
  func start() {
    let navigationTabBar =  factory.makeMainTabBarController()
    navigation.pushViewController(navigationTabBar, animated: false)
    navigation.navigationBar.isHidden = true
    
    childCoordinators = factory.makeChildCoordinators(delegate: self)
    let childNavigation = childCoordinators.map { $0.navigation.rootViewController }
    childCoordinators.forEach { $0.start() }
    navigationTabBar.viewControllers = childNavigation

  }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
  func didTapLogOut() {
    childCoordinators = []
    delegate?.didFinish()
  }
}
