//
//  URLClass.swift
//  Deals en Route Business
//
//  Created by Ankit on 11/27/17.
//  Copyright © 2017 Solulab. All rights reserved.
//

import Foundation

// Main URL

let BASE_URL = "http://13.233.29.215/"
let MAINURL = "\(BASE_URL)api/v1/"
let IMAGE_URL = "\(BASE_URL)images/profile-pic/"
let BASEURL_GOOGLE_MAP = "https://maps.googleapis.com/maps/api/directions/json?"

enum MethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

var StripePublishableKey: String {
    if isLive {
        return ""
    } else {
        
        return "pk_test_wZO5Tj07dVG3OZoHnNp49uos"//"pk_test_Ys5URGTg24XfoRDND6tCSBXM"
    }
}

var StripeSecrateKey: String {
    if isLive {
        return ""
    } else {
        return "sk_test_NATNeJbFoLR2yXyRb5QDSx1S"//"sk_test_uo9ckfkNcsiFxtR64A2GAnny"
    }
}

struct URLClass {
    
    // login & forgot password
    static let ksignin                          = "\(MAINURL)login"
    static let kforgotPassword                  = "\(MAINURL)forgotPassword"
    
    // account settings
    static let kupdateRestaurentProfile         = "\(MAINURL)updateRestaurentProfile"
    static let kaddRestaurentPictures           = "\(MAINURL)addRestaurentPictures"
    static let kremoveRestaurentPictures        = "\(MAINURL)removeRestaurentPictures"
    
    // restrutant status
    static let krestaurentStatusUpdate          = "\(MAINURL)restaurentStatusUpdate"

    // Home & past order
    static let kgetOrders                       = "\(MAINURL)getOrders"
    static let kgetOrdersDetails                = "\(MAINURL)getOrdersDetails"
    static let korderStatusUpdate               = "\(MAINURL)orderStatusUpdate"
    static let kgetRestaurentNotificationList   = "\(MAINURL)getRestaurentNotificationList"
    static let ksendVoucher                     = "\(MAINURL)sendVoucher"
    
    // logout
    static let klogOut                          = "\(MAINURL)logout"
    
    //static let kgetEphemeralkey                 = "\(MAINURL)common/getEphemeralkey"
    
    
}
