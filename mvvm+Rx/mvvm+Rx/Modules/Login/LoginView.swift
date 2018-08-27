//
//  LoginView.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 24/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FacebookLogin

/*
 Code for dependency injection:
    self.register(LoginView.self) { resolver in
        LoginView()
    }
 */

protocol LoginViewDelegate: class {
    func closeLogin()
}

class LoginView: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    weak var delegate: LoginViewDelegate?
    let repository: SignInRepository
    
    init(repository: SignInRepository) {
        self.repository = repository
        super.init(nibName: String(describing: LoginView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupBindings()
    }
    
}

extension LoginView {
    
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        
        self.loginButton.rx.tap.bind {
            let loginManager = LoginManager()
            loginManager.logIn(readPermissions: [.publicProfile, .userGender, .custom("groups_access_member_info"), .custom("pages_show_list")], viewController: self, completion: { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success:
                   self.delegate?.closeLogin()
                    print("Logged in!")
                }
            })
           // viewModel.getFacebookId()
            
            }.disposed(by: rx.disposeBag)

    }
}
