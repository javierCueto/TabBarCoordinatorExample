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
    userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
    userConfigurationCoordinator?.start()
    guard let userConfigurationCoordinator = userConfigurationCoordinator else { return }
    navigation.present(
      userConfigurationCoordinator.navigation.rootViewController,
      animated: true)
    userConfigurationCoordinator.navigation.dismissNavigation = { [weak self] in
      self?.userConfigurationCoordinator = nil
    }
  }
}

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate {
  func didFinish() {
    userConfigurationCoordinator = nil
    navigation.dismiss(animated: true)
  }
}
