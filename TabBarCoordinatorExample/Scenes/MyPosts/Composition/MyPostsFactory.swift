//
//  MyPostsFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

//TODO: - Use a protocol instead a concrete type
struct MyPostsFactory: ItemTabBarFactory {
  func makeMyPostViewController(coordinator: MyPostsViewControllerCoordinator) -> UIViewController {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
    
    let controller = MyPostsViewController(
      collectionViewLayout: layout,
      coordinator: coordinator)
    
    controller.navigationItem.title = "My Posts 📜"
    
    return controller
  }
  
  func makeItemTabBar(navigation: Navigation) {
    makeItemTabBar(navigation: navigation, title: "My Posts", image: "list.bullet.rectangle.portrait", selectedImage: "list.bullet.rectangle.portrait.fill")
  }
  
  func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator) -> UIViewController {
    let controller = NewPostViewController(coordinator: coordinator)
    return controller
  }
  
  func makePostDetailCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator) -> Coordinator {
    let factory = PostDetailFactory(id: id)
    let coordinator = PostDetailCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
    return coordinator
  }
}
