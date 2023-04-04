//
//  MainTabBarFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

struct MainTabBarFactory {
  let appDIContainer: AppDIContainer?
  
  func makeMainTabBarController() -> UITabBarController {
    let mainTabBarController = MainTabBarController()
    //mainTabBarController.viewControllers = []
    return mainTabBarController
  }
  
  func makeChildCoordinators(delegate: SettingsCoordinatorDelegate) -> [Coordinator] {
    let settingsCoordinator = makeSettingsCoordinator(delegate: delegate)
    let communitiesCoordinator = makeCommunitiesCoordinator()
    let myPostCoordinator = makeMyPostCoordinator()
    let homeCoordinator = makeHomeCoordinator()
    
    return [homeCoordinator, myPostCoordinator, communitiesCoordinator, settingsCoordinator]
  }
  
  private func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> Coordinator {
    let factory = SettingsFactory(appDIContainer: appDIContainer)
    let navigation = UINavigationController()
    return SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)
  }
  
  private func makeCommunitiesCoordinator() -> Coordinator {
    let factory = CommunitiesFactoryImp()
    let navigation = UINavigationController()
    return CommunitiesCoordinator(navigation: navigation, factory: factory)
  }
  
  private func makeMyPostCoordinator() -> Coordinator {
    let factory = MyPostsFactory()
    let mediator = MyPostsMediatorImp()
    let navigation = UINavigationController()
    return MyPostsCoordinator(navigation: navigation, factory: factory, mediator: mediator)
  }

  private func makeHomeCoordinator() -> Coordinator {
    let factory = HomeFactoryImp()
    let navigation = UINavigationController()
    return HomeCoordinator(navigation: navigation, factory: factory)
  }
}
