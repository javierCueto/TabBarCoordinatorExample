//
//  ItemTabBarFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol ItemTabBarFactory { }

extension ItemTabBarFactory {
  func makeItemTabBar(
    navigation: Navigation,
    title: String,
    image: String,
    selectedImage: String
  ) {
  
    let tabBarItem = UITabBarItem(
      title: title,
      image: UIImage(systemName: image),
      selectedImage: UIImage(systemName: selectedImage))
    
    navigation.rootViewController.tabBarItem = tabBarItem
  }
}
