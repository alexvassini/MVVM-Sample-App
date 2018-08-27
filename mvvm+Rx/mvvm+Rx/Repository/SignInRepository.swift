//
//  SignInRepository.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 24/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import RxSwift



protocol SignInRepository: class {
    
     func getFacebookId() -> Single<Bool>
}
