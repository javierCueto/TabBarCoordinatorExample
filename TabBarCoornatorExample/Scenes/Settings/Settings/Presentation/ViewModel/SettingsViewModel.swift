//
//  SettingsViewModel.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

//TODO: - Use a protocol instead a concrete type
final class SettingsViewModel {
  private var itemsSettingsViewModel: [ItemSettingsViewModel] = [
    ItemSettingsViewModel(
      title: "User Configuration",
      icon: "person",
      isNavigable: false,
      navigation: .userConfiguration),
    ItemSettingsViewModel(
      title: "Account",
      icon: "archivebox.circle",
      isNavigable: true,
      navigation: .account),
    ItemSettingsViewModel(
      title: "Theme",
      icon: "paintbrush",
      isNavigable: true,
      navigation: .theme),
    ItemSettingsViewModel(
      title: "LogOut",
      icon: "door.right.hand.open",
      isNavigable: false,
      navigation: .logout),
    ItemSettingsViewModel(
      title: "Version App 1.0.1",
      icon: "apps.iphone",
      isNavigable: false,
      navigation: .noNavigation),
  ]
  
  private let auth: LogOutAuth?
  
  var settingsCount: Int {
    itemsSettingsViewModel.count
  }
  
  init(auth: LogOutAuth?) {
    self.auth = auth
  }
  
  private func logOut() {
    auth?.logOut()
  }
  
  func getItemSettingsViewModel(row: Int) -> ItemSettingsViewModel {
    itemsSettingsViewModel[row]
  }
  
  func cellSelected(row: Int) -> SettingsViewNavigation {
    let navigation = itemsSettingsViewModel[row].navigation
    if navigation == .logout {
      logOut()
    }
    
    return navigation
  }
}
