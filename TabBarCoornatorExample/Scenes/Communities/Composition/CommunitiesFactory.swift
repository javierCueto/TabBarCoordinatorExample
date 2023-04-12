//
//  CommunitiesFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol CommunitiesFactory {
  func makeMyCommunitiesViewController() -> UIViewController
  func makeItemTabBar(navigation: Navigation)
}

//TODO: - Use constant file
struct CommunitiesFactoryImp: CommunitiesFactory {
  func makeMyCommunitiesViewController() -> UIViewController {
    let controller = CommunitiesViewController()
    controller.navigationItem.title = "Communities 👥"
    return controller
  }
  
  func makeItemTabBar(navigation: Navigation) {
    makeItemTabBar(navigation: navigation, title: "Communities", image: "person.3", selectedImage: "person.3.fill")
  }
}

extension CommunitiesFactoryImp: ItemTabBarFactory { }
