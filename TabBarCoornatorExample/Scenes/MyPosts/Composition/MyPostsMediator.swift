//
//  MyPostsMediator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol MyPostsMediator {
  func updateController(title: String, navigation: UINavigationController)
}

struct MyPostsMediatorImp: MyPostsMediator {
  func updateController(title: String, navigation: UINavigationController) {
    guard
      let myPostViewController = navigation.topViewController as? MyPostsViewController
    else { return }
    
    myPostViewController.updateLabel(title: title)
  }
}
