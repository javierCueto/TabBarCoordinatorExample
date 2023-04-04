//
//  Coordinator.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol Coordinator: AnyObject {
  var navigation: Navigation { get set }
  func start()
}
