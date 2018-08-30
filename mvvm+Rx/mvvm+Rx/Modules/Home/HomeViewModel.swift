//
//  HomeViewModel.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 22/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import RxSwift
import RxCocoa
import FBSDKCoreKit

class HomeViewModel {
    
    //let input: Driver<Void>
    var facebookFeed: FacebookFeed!
    var facebookAttachments: FeedAttachments!
    init() {
        
    }
    
    
    func request() {
        
        FBSDKGraphRequest(graphPath: "/2372482209645454/feed", parameters: nil).start { (connection, response, error) in
           
            if let data = response as? [String : Any] {
                do {
                    self.facebookFeed = try JSONDecoder().decode(FacebookFeed.self, from: jsonSerializedUTF8(json: data))
                    print(response.debugDescription)
                } catch(let error) { 
                    print(error)
                }
            }
        }
        
        FBSDKGraphRequest(graphPath: "/2372482209645454/feed", parameters: ["fields": "attachments"]).start { (connection, response, error) in
            
            if let data = response as? [String : Any] {
                do {
                    self.facebookAttachments = try JSONDecoder().decode(FeedAttachments.self, from: jsonSerializedUTF8(json: data))
                    print(response.debugDescription)
                } catch(let error) {
                    print(error)
                }
            }
        }
  
    }
}
