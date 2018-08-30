//
//  SignInRepositoryImpl.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 24/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit
import RxSwift
import FacebookLogin

class SignInRepositoryImpl: SignInRepository {
    
    let service: AuthService
    
    init(service: AuthService) {
        self.service = service
    }
    
    func getFacebookId() -> Single<Bool> {
        return self.service.facebookLogin()
    }
    
}
