//
//  SettingsCoordinatror+SettingsCoordinatrorViewCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

extension SettingsCoordinator: SettingsViewControllerCoordinator {
  func didSelectCell(settingsViewNavigation: SetingsViewNavigation) {
    switch settingsViewNavigation {
    case .userConfiguration:
      break
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
}
