//
//  AppCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class AppCoordinator: Coordinator {
  var navigation: UINavigationController
  private var loginCoordinator: Coordinator?
  var window: UIWindow?
  var factory: AppFactory?
  var auth: SessionCheckerAuth?
  
  init(navigation: UINavigationController, window: UIWindow?, factory: AppFactory?, auth: Auth?) {
    self.navigation = navigation
    self.window = window
    self.factory = factory
    self.auth = auth
  }
  
  func start() {
    configWindow()
    startSomeCoordinator()
  }
  
  private func configWindow() {
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()
  }
  
  private func startSomeCoordinator() {
    guard let auth = auth else { return }
    if auth.isSessionActive {
      print("open tabbar")
    } else {
      loginCoordinator = factory?.makeLogInCoordinator(navigation: navigation, delegate: self)
      loginCoordinator?.start()
    }

  }
  
}

extension AppCoordinator: LogInCoordinatorDelegate {
  func didFinishLogin() {
    startSomeCoordinator()
    navigation.viewControllers = []
    loginCoordinator = nil
  }
}
