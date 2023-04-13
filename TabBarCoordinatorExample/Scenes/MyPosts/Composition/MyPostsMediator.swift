//
//  MyPostsMediator.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol MyPostsMediator {
  func updateController(title: String, navigation: Navigation)
}

struct MyPostsMediatorImp: MyPostsMediator {
  func updateController(title: String, navigation: Navigation) {
    guard
      let myPostViewController = navigation.rootViewController.topViewController as? MyPostsViewController
    else { return }
    
    myPostViewController.updateLabel(title: title)
  }
}
