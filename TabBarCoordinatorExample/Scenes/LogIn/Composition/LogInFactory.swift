//
//  LogInFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

//TODO: - Use a protocol instead a concrete type
struct LogInFactory {
  let appDIContainer: AppDIContainer?
  
  func makeLogInViewController(coordinator: LogInViewControllerCoordinator) -> UIViewController {
    return LogInViewController(
      coordinator: coordinator,
      viewModel: LogInViewModel(logInAuth: appDIContainer?.auth))
  }
}
