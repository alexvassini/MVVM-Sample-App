//
//  DefaultContainer.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 30/07/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import Foundation
import Swinject
import Moya
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
        
        
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        
    }
    
    func getDefaultPlugins() -> [PluginType] {
        
        return [NetworkLoggerPlugin(verbose: true)]
        
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

