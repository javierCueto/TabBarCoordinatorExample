//
//  LogInFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

struct LogInFactory {
  let appDIContainer: AppDIContainer?
  
  func makeLogInViewController(coordinator: LogInViewControllerCoordinator) -> UIViewController {
    return LogInViewController(
      coordinator: coordinator,
      viewModel: LogInViewModel(logInAuth: appDIContainer?.auth))
  }
}
