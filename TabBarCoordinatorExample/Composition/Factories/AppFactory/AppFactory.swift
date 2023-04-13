//
//  AppFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

//TODO: - Use a protocol instead a concrete type
struct AppFactory {
  let appDIContainer: AppDIContainer?
  
  func makeLogInCoordinator(
    navigation: Navigation,
    delegate: LogInCoordinatorDelegate
  ) -> Coordinator {
    let logInFactory = LogInFactory(appDIContainer: appDIContainer)
    return LogInCoordinator(navigation: navigation, factory: logInFactory, delegate: delegate)
  }
  
  func makeMainTabBarCoordinator(
    navigation: Navigation,
    delegate: MainTabBarCoordinatorDelegate
  ) -> Coordinator {
    let factory = MainTabBarFactory(appDIContainer: appDIContainer)
    return MainTabBarCoordinator(navigation: navigation, factory: factory, delegate: delegate)
  }
}
