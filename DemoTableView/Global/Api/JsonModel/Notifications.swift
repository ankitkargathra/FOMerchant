//
//  Notifications.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 09/11/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation

class GetRestaurentNotificationList {
    
    var restaurentId:String!
    
    init(restaurentId: String) {
        self.restaurentId = restaurentId
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let restaurentId = restaurentId { dict[EPConstant.GetRestaurentNotificationListKey.restrutantId] = restaurentId }
        return dict
    }
}

class SendVoucer {
    
    var restaurentId:String!
    var to:String!
    var msg:String!
    var offer:String!
    
    init(restaurentId: String,to: String,msg: String,offer: String) {
        self.restaurentId = restaurentId
        self.to = to
        self.msg = msg
        self.offer = offer
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let restaurentId = restaurentId { dict[EPConstant.SendVoucerKey.restrutantId] = restaurentId }
        if let to = to { dict[EPConstant.SendVoucerKey.to] = to }
        if let msg = msg { dict[EPConstant.SendVoucerKey.msg] = msg }
        if let offer = offer { dict[EPConstant.SendVoucerKey.offer] = offer }
        return dict
    }
}
class Logout {
    
    var userId:String!
    
    init(userId: String) {
        self.userId = userId
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let userId = userId { dict[EPConstant.LogoutKey.userId] = userId }
        return dict
    }
}
