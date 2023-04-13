//
//  LogInViewModel.swift
//  TabBarCoordinatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

//TODO: - Use a protocol instead a concrete type
final class LogInViewModel {
  var logInAuth: LogInAuth?
  
  init(logInAuth: LogInAuth?) {
    self.logInAuth = logInAuth
  }
  
  func login() {
    logInAuth?.logIn()
  }
}
