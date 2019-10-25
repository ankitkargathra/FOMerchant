//
//  GetOrders.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 09/11/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation




class GetOrders {
    
    var restaurentId: String!
    var orderStatus: String!
    
    init(restaurentId: String, orderStatus: String) {
        self.restaurentId = restaurentId
        self.orderStatus = orderStatus
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let restaurentId = restaurentId { dict[EPConstant.GetOrderKey.restaurentId] = restaurentId }
        if let orderstatus = orderStatus { dict[EPConstant.GetOrderKey.orderstatus] = orderstatus }
        return dict
    }
}

class GetOrdersDetails {
    
    var orderId:String!
    var restaurentId:String!
    
    init(orderId: String, restaurentId:String) {
        self.orderId = orderId
        self.restaurentId = restaurentId
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let orderId = orderId { dict[EPConstant.GetOrderKey.orderId] = orderId }
        if let restaurentId = restaurentId { dict[EPConstant.GetOrderKey.restaurentId] = restaurentId }
        return dict
    }
}
class GetOrderStatusUpdate {
    
    var userId:String!
    var orderId:String!
    var status:String!
    
    init(userId: String,orderId: String,status: String) {
        self.userId = userId
        self.orderId = orderId
        self.status = status
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let userId = userId { dict[EPConstant.GetOrderStatusUpdateKey.userId] = userId }
        if let orderId = orderId { dict[EPConstant.GetOrderStatusUpdateKey.orderId] = orderId }
        if let status = status { dict[EPConstant.GetOrderStatusUpdateKey.status] = status }
        return dict
    }
}
