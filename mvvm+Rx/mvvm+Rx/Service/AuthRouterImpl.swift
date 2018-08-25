//
//  AuthRouterImpl.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 13/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import Foundation
import RxSwift
import FacebookCore
import FacebookLogin
import FBSDKCoreKit

enum LoginError: Error {
 
    case cancel
}

class AuthServiceImpl: AuthService {
    
    let loginManager = LoginManager()
    
    
    
    func facebookLogin() -> Single<Bool> {
        
        loginManager.logOut()
        
        return Single<Bool>.create{ single in
            self.loginManager.logIn(readPermissions: [.publicProfile,
                                                 .userGender,
                                                 .custom("groups_access_member_info"),
                                                 .custom("pages_show_list")],
                               viewController: nil,
                               completion: { loginResult in
                                
                                switch loginResult {
                                case .failed(let error):
                                     single(.error(error))
                                    return
                                case .cancelled:
                                    single(.error(LoginError.cancel))
                                    return
                                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                                    print("grantedPermissions: \(grantedPermissions)")
                                    print("declinedPermissions: \(declinedPermissions)")
                                    print("accessToken: \(accessToken)")
                                    single(.success(true))
                                    return
                                }
            })
            return Disposables.create() {}
        }
    }
}
