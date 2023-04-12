//
//  UserConfigurationViewController.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 12/04/23.
//

import UIKit

protocol UserConfigurationViewControllerCoordinator: AnyObject {
  func didSelectAvatarButton()
  func didFinishFlow()
}

final class UserConfigurationViewController: UIViewController {
  // MARK: - Public properties
  
  // MARK: - Private properties
  private weak var coordinator: UserConfigurationViewControllerCoordinator?
  
  // MARK: - Life Cycle
  init(coordinator: UserConfigurationViewControllerCoordinator) {
    super.init(nibName: nil, bundle: nil)
    self.coordinator = coordinator
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
  }
  
  // MARK: - Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
    
    let avatarButton = UIBarButtonItem(
      image: UIImage(systemName: "person"),
      primaryAction: avatarAction())
    
    navigationItem.rightBarButtonItem = avatarButton
    
    let closeButton = UIBarButtonItem(
      systemItem: .close,
      primaryAction: closeFlowAction())
    
    navigationItem.leftBarButtonItem = closeButton
  }
  
  // MARK: - Actions
  func avatarAction() -> UIAction {
    UIAction { [weak self] _ in
      self?.coordinator?.didSelectAvatarButton()
    }
  }
  
  func closeFlowAction() -> UIAction {
    UIAction { [weak self] _ in
      self?.coordinator?.didFinishFlow()
    }
  }
}
