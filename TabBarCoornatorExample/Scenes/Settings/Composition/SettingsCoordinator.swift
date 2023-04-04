//
//  SettingsCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
  func didTapLogOut()
}


final class SettingsCoordinator: Coordinator {
  var navigation: UINavigationController
  var factory: SettingsFactory
  weak var delegate: SettingsCoordinatorDelegate?
  
  init(
    navigation: UINavigationController,
    factory: SettingsFactory,
    delegate: SettingsCoordinatorDelegate
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }
  
  func start() {
    let controller = factory.makeSettingsController(coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

