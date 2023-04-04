//
//  Coordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol Coordinator: AnyObject {
  var navigation: UINavigationController { get set }
  func start()
}
