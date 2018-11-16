//
//  Login.swift
//  Starbox
//
//  Created by Rohan on 26/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

//MARK: Register Request

class updateRestaurentProfile {
    
    var name: String!
    var phone : String!
    var address : String!
    
    init(name: String,phone : String,address:String)
    {
        self.name = name
        self.phone = phone
        self.address = address
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
//        dict["userId"] = kCurrentUser.id!
        if let name = name { dict[EPConstant.UpdateProfileKey.name] = name }
        if let phone = phone { dict[EPConstant.UpdateProfileKey.phone] = phone }
        if let address = address { dict[EPConstant.UpdateProfileKey.address] = address }
        return dict
    }
}

class addRestaurentPicture {
    
    var id: String!
    
    init(id: String)
    {
        self.id = id
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        //        dict["userId"] = kCurrentUser.id!
        if let id = id { dict[EPConstant.UpdateProfileKey.restrutantId] = id }
        return dict
    }
}

class RemoveRestaurentPicture {
    
    var id: String!
    
    init(id: String)
    {
        self.id = id
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        //        dict["userId"] = kCurrentUser.id!
        if let id = id { dict[EPConstant.UpdateProfileKey.id] = id }
        return dict
    }
}
