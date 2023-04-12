//
//  SettingsCoordinator+SettingsCoordinatorViewCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

extension SettingsCoordinator: SettingsViewControllerCoordinator {
  func didSelectCell(settingsViewNavigation: SettingsViewNavigation) {
    switch settingsViewNavigation {
    case .userConfiguration:
      callUserConfigurationCoordinator()
    case .account:
      navigation.pushViewController(factory.makeAccountViewController(), animated: true)
    case .theme:
      navigation.pushViewController(factory.makeThemeViewController(), animated: true)
    case .logout:
      delegate?.didTapLogOut()
    case .noNavigation:
      break
    }
  }
  
  private func callUserConfigurationCoordinator() {
    let userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
    addChildCoordinatorStar(userConfigurationCoordinator)
    
    navigation.present(
      userConfigurationCoordinator.navigation.rootViewController,
      animated: true)
    
    userConfigurationCoordinator.navigation.dismissNavigation = { [weak self] in
      self?.removeChildCoordinator(userConfigurationCoordinator)
    }
  }
}
