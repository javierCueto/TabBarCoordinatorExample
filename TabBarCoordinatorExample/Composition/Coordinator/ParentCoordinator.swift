//
//  ParentCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

protocol ParentCoordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
}

extension ParentCoordinator {
  func addChildCoordinatorStar(_ childCoordinator: Coordinator?) {
    guard let childCoordinator = childCoordinator else { return }
    childCoordinators.append(childCoordinator)
    childCoordinator.start()
  }
  
  func removeChildCoordinator(_ childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
  }
  
  func clearAllChildsCoordinator() {
    childCoordinators = []
  }
}
