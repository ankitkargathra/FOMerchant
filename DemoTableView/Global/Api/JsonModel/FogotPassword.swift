//
//  Login.swift
//  Starbox
//
//  Created by Rohan on 26/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

//MARK: Register Request

class ForgotPassword {
    
    var email: String!
   
    init(email: String)
    {
        self.email = email
        
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let email = email { dict[EPConstant.LoginKey.email] = email }
        return dict
    }
}
