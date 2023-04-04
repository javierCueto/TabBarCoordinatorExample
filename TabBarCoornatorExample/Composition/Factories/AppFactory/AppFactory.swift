//
//  AppFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

struct AppFactory {
  let appDIContainer: AppDIContainer?
  
  func makeLogInCoordinator(
    navigation: UINavigationController,
    delegate: LogInCoordinatorDelegate
  ) -> Coordinator {
    let logInFactory = LogInFactory(appDIContainer: appDIContainer)
    let coordinator = LogInCoordinator(navigation: navigation, factory: logInFactory, delegate: delegate)
    return coordinator
  }
}
