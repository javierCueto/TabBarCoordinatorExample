//
//  Navigation.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol Navigation {
  var rootViewController: UINavigationController { get }
  var viewControllers: [UIViewController] { get set }
  var navigationBar: UINavigationBar { get }
  func present(_ viewControllerToPresent: UIViewController, animated: Bool)
  func pushViewController(
  _ viewControllerToPresent: UIViewController,
  animated: Bool, backCompletion: (() -> Void)?
  )
  func dismiss(animated: Bool)
  var dismissNavigation: (() -> Void)? { get set }
}

extension Navigation {
  func pushViewController(_ viewControllerToPresent: UIViewController, animated: Bool) {
    pushViewController(viewControllerToPresent, animated: animated, backCompletion: nil)
  }
}

final class NavigationImp: NSObject {
  var rootViewController: UINavigationController
  var dismissNavigation: (() -> Void)?
  
  private var backCompletions: [UIViewController: () -> Void] = [ : ]
  
  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
    super.init()
    rootViewController.delegate = self
    rootViewController.presentationController?.delegate = self
  }
  
}

extension NavigationImp: Navigation {

  
  var viewControllers: [UIViewController] {
    get {
      rootViewController.viewControllers
    }
    set {
      rootViewController.viewControllers = newValue
    }
  }
  
  var navigationBar: UINavigationBar {
    rootViewController.navigationBar
  }
  
  func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
    rootViewController.present(viewControllerToPresent, animated: animated)
  }
  
  func dismiss(animated: Bool) {
    rootViewController.dismiss(animated: animated)
  }
  
  func pushViewController(
    _ viewControllerToPresent: UIViewController,
    animated: Bool, backCompletion: (() -> Void)?
  ) {
    if let backCompletion = backCompletion {
      backCompletions[viewControllerToPresent] = backCompletion
    }
    rootViewController.pushViewController(viewControllerToPresent, animated: animated)
  }
}

extension NavigationImp: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    guard
      let controller = navigationController
        .transitionCoordinator?
        .viewController(forKey: .from),
      !navigationController.viewControllers.contains(controller)
    else { return }
  
    guard let completion = backCompletions[controller] else { return }
    completion()
    backCompletions.removeValue(forKey: controller)
  }
}

extension NavigationImp: UIAdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    dismissNavigation?()
    dismissNavigation = nil
  }
}
