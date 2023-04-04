//
//  LogInCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol LogInCoordinatorDelegate: AnyObject {
  func didFinishLogin()
}

final class LogInCoordinator: Coordinator {
  var navigation: UINavigationController
  var factory: LogInFactory
  weak var delegate: LogInCoordinatorDelegate?
  
  init(
    navigation: UINavigationController,
    factory: LogInFactory,
    delegate: LogInCoordinatorDelegate
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }
  
  func start() {
    let controller = factory.makeLogInViewController(coordinator: self)
    navigation.pushViewController(controller, animated: true)
  }

}

extension LogInCoordinator: LogInViewControllerCoordinator {
  func didFish() {
    delegate?.didFinishLogin()
  }
}
