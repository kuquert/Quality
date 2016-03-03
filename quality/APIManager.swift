//
//  APIManager.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 3/1/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

typealias SuccessBlock = (success: Bool, error: ErrorType?, trainer: Trainer?) -> ()

enum LoginError: ErrorType {
    case InvalidCredentials
    case ServerResponseTimeout
}

class APIManager: NSObject {
    
    static let apiURL = "http://server03.local:60080/login"
    static let sharedInstance = APIManager()
    var currentTrainer: Trainer?
    
    override init() {
        print("APIManager initialized")
    }
    
    static func login(user user: String, password: String, block: SuccessBlock){
        Alamofire.request(.GET, apiURL, parameters: ["user" : user, "password": password], encoding: .URL, headers: nil).responseJSON{ response in
            if let resp = response.result.value!["response"] as? String{
                if resp == "true"{
                    if let js = response.result.value!["data"]{
                        let trainer = Trainer(json: js as! JSON)
                        sharedInstance.currentTrainer = trainer
                        block(success: true, error: nil, trainer: trainer)
                    }
                }else{
                    block(success: false, error: LoginError.InvalidCredentials, trainer: nil)
                }
            }
        }
    }

}