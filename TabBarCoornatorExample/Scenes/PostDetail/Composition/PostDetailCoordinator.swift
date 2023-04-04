//
//  PostDetailCoordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

final class PostDetailCoordinator: Coordinator {
  var navigation: UINavigationController
  private let factory: PostDetailFactory
  
  init(navigation: UINavigationController, factory: PostDetailFactory) {
    self.navigation = navigation
    self.factory = factory
  }
  
  func start() {
    let controller = factory.makePostDetailViewController(coordinator: self)
    navigation.pushViewController(controller, animated: true)
  }
  
  
}

extension PostDetailCoordinator: PostDetailControllerCoordinator {
  func didTapPhotosButton() {
    navigation.present(factory.makePhotosViewController(), animated: true)
  }
  
  func didTapMoreDetailButton() {
    navigation.present(factory.makeMoreDetailViewController(), animated: true)
  }
  
  func didTapSourceButton() {
    navigation.present(factory.makeSourceViewController(), animated: true)
  }
  
}
