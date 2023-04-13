//
//  SettingsViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

import UIKit

protocol SettingsViewControllerCoordinator: AnyObject {
  func didSelectCell(settingsViewNavigation: SettingsViewNavigation)
}

final class SettingsViewController: UITableViewController {
  
  // MARK: - Private properties
  private let viewModel: SettingsViewModel
  private weak var coordinator: SettingsViewControllerCoordinator?
  
  // MARK: - Life Cycle
  
  init(viewModel: SettingsViewModel, coordinator: SettingsViewControllerCoordinator) {
    self.viewModel = viewModel
    self.coordinator = coordinator
    super.init(style: .insetGrouped)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
    configTableView()
  }
  
  // MARK: - Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
  }
  
  private func configTableView() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    tableView.backgroundColor = .systemGroupedBackground
  }
  
  // MARK: - Actions
  
}

// MARK: - Extensions here
extension SettingsViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.settingsCount
  }
  
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let viewModel = viewModel.getItemSettingsViewModel(row: indexPath.row)
    let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
    
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = viewModel.title
    contentConfiguration.image = UIImage(systemName: viewModel.icon)
    cell.contentConfiguration = contentConfiguration
    if !viewModel.isNavigable {
      cell.selectionStyle = .none
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let navigation =  viewModel.cellSelected(row: indexPath.row)
    coordinator?.didSelectCell(settingsViewNavigation: navigation)
  }
}
