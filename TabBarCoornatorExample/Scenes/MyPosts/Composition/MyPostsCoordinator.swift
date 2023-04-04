//
//  MyPostsCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class MyPostsCoordinator: Coordinator {
  var navigation: UINavigationController
  private let factory: MyPostsFactory
  private let mediator: MyPostsMediator
  private var postDetailCoordinator: Coordinator?
  
  init(
    navigation: UINavigationController,
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
    postDetailCoordinator = factory.makePostDetailCoordinator(navigation: navigation, id: id)
    postDetailCoordinator?.start()
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
