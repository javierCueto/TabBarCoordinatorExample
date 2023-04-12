//
//  UserConfigurationFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

import UIKit

struct UserConfigurationFactory {
  func makeUserConfigurationViewController(
    coordinator: UserConfigurationViewControllerCoordinator
  ) -> UIViewController {
    let userConfigurationViewController = UserConfigurationViewController(
      coordinator: coordinator)
    
    userConfigurationViewController.title = "User Configuration"
    
    return userConfigurationViewController
  }
  
  func makeAvatarViewController() -> UIViewController {
    let exampleController = ExampleViewController()
    exampleController.title = "Make your avatar"
    return exampleController
  }
}
