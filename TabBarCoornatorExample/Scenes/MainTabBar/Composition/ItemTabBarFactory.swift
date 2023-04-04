//
//  ItemTabBarFactory.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol ItemTabBarFactory { }

extension ItemTabBarFactory {
  func makeItemTabBar(
    navigation: UINavigationController,
    title: String,
    image: String,
    selectedImage: String
  ) {
  
    let tabBarItem = UITabBarItem(
      title: title,
      image: UIImage(systemName: image),
      selectedImage: UIImage(systemName: selectedImage))
    
    navigation.tabBarItem = tabBarItem
  }
}
