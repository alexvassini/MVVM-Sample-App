//
//  ViewController.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 30/07/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FacebookCore
import FacebookLogin
import FBSDKCoreKit


class ViewController: UIViewController {

    @IBOutlet weak var facebookLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notButtonPressed(_ sender: Any) {
        getPosts()
    }
    
}


extension ViewController {
    
    func setupBindings() {
        
        self.facebookLoginButton.rx.tap.bind { _ in
           let loginManager = LoginManager()
            loginManager.logIn(readPermissions: [.publicProfile, .userGender, .custom("groups_access_member_info"), .custom("pages_show_list")], viewController: self, completion: { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success:
                    
                    print("Logged in!")
                }
            })

            }.disposed(by: rx.disposeBag)
        
        
    }
    
    func getPosts() {
        
        FBSDKGraphRequest(graphPath: "/2372482209645454/feed", parameters: nil).start { (connection, response, error) in
            
            if let _ = response as? [String: AnyObject] {
                print(response.debugDescription)
            }
            
            
        }
        
    }
    
}



//
//FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
//initWithGraphPath:@"/2372482209645454/feed"
//parameters:nil
//HTTPMethod:@"GET"];
//[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//// Insert your code here
//}];

//FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
//    initWithGraphPath:@"/2372482209645454/feed"
//    parameters:@{ @"fields": @"attachments",}
//    HTTPMethod:@"GET"];
//[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//    // Insert your code here
//    }];
