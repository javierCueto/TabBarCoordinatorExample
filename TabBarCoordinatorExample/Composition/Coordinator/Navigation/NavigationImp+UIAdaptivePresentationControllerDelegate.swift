//
//  NavigationImp+UIAdaptivePresentationControllerDelegate.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

import UIKit

extension NavigationImp: UIAdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    dismissNavigation?()
    dismissNavigation = nil
  }
}
