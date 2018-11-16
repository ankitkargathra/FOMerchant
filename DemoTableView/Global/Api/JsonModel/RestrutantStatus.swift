//
//  RestrutantStatus.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 09/11/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation



class RestrutantStatus {
    
    var restaurentId: String!
    var status: String!
    var open: String!
    
    init(restaurentId: String, status: String, open:String) {
        self.restaurentId = restaurentId
        self.status = status
        self.open = open
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let restaurentId = restaurentId { dict[EPConstant.RestaurantStatusKey.restaurentId] = restaurentId }
        if let status = status { dict[EPConstant.RestaurantStatusKey.status] = status }
        if let open = open { dict[EPConstant.RestaurantStatusKey.open] = open }
        return dict
    }
}
