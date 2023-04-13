//
//  LogInViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//


import UIKit

protocol LogInViewControllerCoordinator: AnyObject {
  func didFish()
}

final class LogInViewController: UIViewController {

  // MARK: - Private properties
  private weak var coordinator: LogInViewControllerCoordinator?
  //TODO: - Use the VM protocol
  private let viewModel: LogInViewModel
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    var configuration =  UIButton.Configuration.filled()
    configuration.title = "Log In"
    button.configuration = configuration
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: - Life Cycle
  init(coordinator: LogInViewControllerCoordinator?, viewModel: LogInViewModel) {
    self.coordinator = coordinator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
    configAction()
  }
  
  // MARK: - Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
    
    view.addSubview(loginButton)
    
    loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  // MARK: - Actions
  private func configAction() {
    let loginAction = UIAction { [weak self] _ in
      self?.viewModel.login()
      self?.coordinator?.didFish()
    }
    loginButton.addAction(loginAction, for: .touchUpInside)
  }
}
