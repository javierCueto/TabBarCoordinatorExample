//
//  SettingsCoordinator+UserConfigurationCoordinatorDelegate.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate {
  func didFinish(childCoordinator: Coordinator) {
    childCoordinator.navigation.dismissNavigation = nil
    removeChildCoordinator(childCoordinator)
    navigation.dismiss(animated: true)
  }
}
