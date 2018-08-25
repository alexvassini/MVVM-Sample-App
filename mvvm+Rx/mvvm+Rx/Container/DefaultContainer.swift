//
//  DefaultContainer.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 30/07/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import Foundation
import Swinject
import Rswift

final class DefaultContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        self.registerServices()
        self.registerViews()
        self.registerStorage()
        self.registerRepositories()
    }
}

//Register Views
extension DefaultContainer {
    func registerViews() {
       
        self.container.register(HomeView.self) { resolver in
            HomeView(
                //posts repository
            )
        }
        
    }
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        
    }
    
 
}


//Register Storage
extension DefaultContainer {
    
    func registerStorage() {
        
    }
}


//Register Repositories
extension DefaultContainer {
    
    func registerRepositories() {
        
    }
    
}

