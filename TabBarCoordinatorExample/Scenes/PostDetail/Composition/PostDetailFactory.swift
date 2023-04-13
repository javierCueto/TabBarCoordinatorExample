//
//  PostDetailFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

//TODO: - Use a protocol instead a concrete type
struct PostDetailFactory {
  private(set) var id: Int
  
  func makePostDetailViewController(
    coordinator: PostDetailControllerCoordinator
  ) -> UIViewController {
    let controller = PostDetailController(coordinator: coordinator)
    controller.title = "Post #\(id)"
    
    return controller
  }
  
  func makePhotosViewController() -> UIViewController {
    makeExampleViewController(title: "Photos")
  }
  
  func makeMoreDetailViewController() -> UIViewController {
    makeExampleViewController(title: "More Detail")
  }
  
  func makeSourceViewController() -> UIViewController {
    makeExampleViewController(title: "Source")
  }
  
  private func makeExampleViewController(title: String) -> UIViewController {
    let controller = ExampleViewController()
    controller.title = title
    let navigation = UINavigationController(rootViewController: controller)
    return navigation
  }
}
