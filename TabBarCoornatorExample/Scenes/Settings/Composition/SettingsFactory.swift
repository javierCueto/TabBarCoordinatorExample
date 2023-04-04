//
//  SettingsFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

struct SettingsFactory: ItemTabBarFactory {
  let appDIContainer: AppDIContainer?
  
  func makeSettingsController(coordinator: SettingsViewControllerCoordinator) -> UIViewController {
    let viewModel = SettingsViewModel(auth: appDIContainer?.auth)
    let controller = SettingsViewController(viewModel: viewModel, coordinator: coordinator)
    controller.title = "Settings ⚙️"
    return controller
  }
  
  func makeTabBarItem(navigation: UINavigationController) {
    makeItemTabBar(navigation: navigation, title: "Setting", image: "gearshape.2", selectedImage: "gearshape.2.fill")
  }
}
