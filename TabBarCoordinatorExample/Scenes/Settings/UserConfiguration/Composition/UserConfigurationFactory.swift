//
//  UserConfigurationFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

import UIKit

//TODO: - Use a protocol and use a constant file
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

