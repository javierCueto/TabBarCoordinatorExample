//
//  NavigationImp+UINavigationControllerDelegate.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

import UIKit

extension NavigationImp: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    guard
      let controller = navigationController
        .transitionCoordinator?
        .viewController(forKey: .from),
      !navigationController.viewControllers.contains(controller)
    else { return }
  
    guard let completion = backCompletions[controller] else { return }
    completion()
    backCompletions.removeValue(forKey: controller)
  }
}
