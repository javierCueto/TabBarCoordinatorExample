//
//  LogInViewModel.swift
//  TabBarCoornatorExample
//
//  Created by Javier Cueto on 03/04/23.
//

final class LogInViewModel {
  var logInAuth: LogInAuth?
  
  init(logInAuth: LogInAuth?) {
    self.logInAuth = logInAuth
  }
  
  func login() {
    logInAuth?.logIn()
  }
}
