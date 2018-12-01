//
//  Login.swift
//  Starbox
//
//  Created by Rohan on 26/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

//MARK: Login Requet

class Login {
    
    var email: String!
    var password: String!
    var usertype: String!
    var deviceId : String!
    var deviceToken : String!
    
    init(email: String, password: String, usertype:String, deviceId:String) {
        self.email = email
        self.password = password
        self.usertype = usertype
        self.deviceId = deviceId
//        self.deviceToken = FCM_TOKEN
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
//        dict["deviceType"] = "0"
        if let email = email { dict[EPConstant.LoginKey.email] = email }
        if let password = password { dict[EPConstant.LoginKey.password] = password }
        if let usertype = usertype { dict[EPConstant.LoginKey.usertype] = usertype }
        if let deviceId = deviceId { dict[EPConstant.LoginKey.deviceId] = deviceId }
//        if let deviceToken = deviceToken { dict[EPConstant.LoginKey.deviceToken] = deviceToken }
        return dict
    }
}


