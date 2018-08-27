//
//  AppCoordinator.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 30/07/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
   

    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        
    }
    
    func start() {
       
        showHomeView()
    }
    
    fileprivate func showHomeView(){
        let view = container.resolve(HomeView.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showLoginView(){
        let view = container.resolve(LoginView.self)!
        view.delegate = self
        self.currentView = view
    }
}

extension AppCoordinator: HomeViewDelegate {
    func openLogin() {
        showLoginView()
    }
}

extension AppCoordinator: LoginViewDelegate {
    func closeLogin() {
        showHomeView()
    }
}


