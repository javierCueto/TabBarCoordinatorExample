//
//  NewPostViewController.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol NewPostViewControllerCoordinator: AnyObject {
  func didSaveNewPost(title: String)
}

final class NewPostViewController: UIViewController {
  // MARK: - Public properties
  
  // MARK: - Private properties
  private let savePostButton: UIButton = {
    let button = UIButton(type: .system)
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Save"
    button.configuration = configuration
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private weak var coordinator: NewPostViewControllerCoordinator?
  
  // MARK: - Life Cycle
  init(coordinator: NewPostViewControllerCoordinator) {
    self.coordinator = coordinator
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
    
    view.addSubview(savePostButton)
    
    savePostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    savePostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  // MARK: - Actions
  private func configAction() {
    let actionSave = UIAction { [weak self] _ in
      guard let self = self else { return }
      self.coordinator?.didSaveNewPost(title: self.randomPost())
    }
    
    savePostButton.addAction(actionSave, for: .touchUpInside)
  }
  
  private func randomPost() -> String {
    "Post #\(Int.random(in: 0...999))"
  }
}

// MARK: - Extensions here
