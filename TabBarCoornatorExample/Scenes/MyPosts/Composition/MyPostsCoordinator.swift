//
//  MyPostsCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class MyPostsCoordinator: Coordinator {
  var navigation: Navigation
  var childCoordinators: [Coordinator] = []
  private let factory: MyPostsFactory
  private let mediator: MyPostsMediator
  
  init(
    navigation: Navigation,
    factory: MyPostsFactory,
    mediator: MyPostsMediator
  ) {
    self.navigation = navigation
    self.factory = factory
    self.mediator = mediator
  }
  
  func start() {
    let controller = factory.makeMyPostViewController(coordinator: self)
    factory.makeItemTabBar(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
  }
}

extension MyPostsCoordinator: MyPostsViewControllerCoordinator {
  func didSelectPost(id: Int) {
    let postDetailCoordinator = factory.makePostDetailCoordinator(navigation: navigation, id: id, parentCoordinator: self)
    addChildCoordinatorStar(postDetailCoordinator)
  }
  
  func didTapAddNewPostButton() {
    let controller = factory.makeNewPostViewController(coordinator: self)
    navigation.present(controller, animated: true)
  }
}

extension MyPostsCoordinator: NewPostViewControllerCoordinator {
  func didSaveNewPost(title: String) {
    navigation.dismiss(animated: true)
    mediator.updateController(title: title, navigation: navigation)
  }
}


extension MyPostsCoordinator: ParentCoordinator { }
