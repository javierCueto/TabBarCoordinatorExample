//
//  MainTabBarController.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//


import UIKit

final class MainTabBarController: UITabBarController {
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
  }
  
  // MARK: - Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
  }
}
