//
//  AppCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class AppCoordinator: Coordinator {
  var navigation: Navigation
  var childCoordinators: [Coordinator] = []
  var window: UIWindow?
  var factory: AppFactory?
  var auth: SessionCheckerAuth?
  
  init(navigation: Navigation, window: UIWindow?, factory: AppFactory?, auth: Auth?) {
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
    window?.rootViewController = navigation.rootViewController
    window?.makeKeyAndVisible()
  }
  
  private func startSomeCoordinator() {
    guard let auth = auth else { return }
    auth.isSessionActive ? startMainTabBarCoordinator() : startLoginCoordinator()
  }
  
  private func startLoginCoordinator() {
    let loginCoordinator = factory?.makeLogInCoordinator(navigation: navigation, delegate: self)
    addChildCoordinatorStar(loginCoordinator)
  }
  
  private func startMainTabBarCoordinator() {
    let mainTabBarCoordinator = factory?.makeMainTabBarCoordinator(
      navigation: navigation,
      delegate: self)
    addChildCoordinatorStar(mainTabBarCoordinator)
  }
  
  // MARK: - Private helpers
  private func clearCoordinatorsAndStart() {
    navigation.viewControllers = []
    clearAllChildsCoordinator()
    startSomeCoordinator()
  }
}

// MARK: - LogInCoordinatorDelegate
extension AppCoordinator: LogInCoordinatorDelegate {
  func didFinishLogin() {
    clearCoordinatorsAndStart()
  }
}

// MARK: - MainTabBarCoordinatorDelegate
extension AppCoordinator: MainTabBarCoordinatorDelegate {
  func didFinish() {
    clearCoordinatorsAndStart()
  }
}

extension AppCoordinator: ParentCoordinator { }
