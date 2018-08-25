//
//  AuthService.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 13/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import RxSwift

protocol AuthService {
    func facebookLogin() -> Single<Bool>
}
