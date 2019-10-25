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
let IMAGE_URL = "\(BASE_URL)assets/profile_picture/"
let BASEURL_GOOGLE_MAP = "https://maps.googleapis.com/maps/api/directions/json?"

enum MethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

enum CardType: String {
    case Unknown, Amex, Visa, MasterCard, Diners, Discover, JCB, Elo, Hipercard, UnionPay
    
    static let allCards = [Amex, Visa, MasterCard, Diners, Discover, JCB, Elo, Hipercard, UnionPay]
    
    var regex : String {
        switch self {
        case .Amex:
            return "^3[47][0-9]{5,}$"
        case .Visa:
            return "^4[0-9]{6,}([0-9]{3})?$"
        case .MasterCard:
            return "^(5[1-5][0-9]{4}|677189)[0-9]{5,}$"
        case .Diners:
            return "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
        case .Discover:
            return "^6(?:011|5[0-9]{2})[0-9]{3,}$"
        case .JCB:
            return "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
        case .UnionPay:
            return "^(62|88)[0-9]{5,}$"
        case .Hipercard:
            return "^(606282|3841)[0-9]{5,}$"
        case .Elo:
            return "^((((636368)|(438935)|(504175)|(451416)|(636297))[0-9]{0,10})|((5067)|(4576)|(4011))[0-9]{0,12})$"
        default:
            return ""
        }
    }
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
    static let kgetRestaurentProfile            = "\(MAINURL)getRestaurentDetails"
    static let kupdateRestaurentProfile         = "\(MAINURL)updateRestaurentProfile"
    static let kgetRestaurentImages             = "\(MAINURL)getRestaurentImage"
    static let kaddRestaurentPictures           = "\(MAINURL)addRestaurentPictures"
    static let kremoveRestaurentPictures        = "\(MAINURL)removeRestaurentPictures"
    
    // restrutant status
    static let krestaurentStatusUpdate          = "\(MAINURL)restaurentStatusUpdate"

    // Home & past order
    static let kgetOrders                       = "\(MAINURL)getOrdersM"
    static let kgetOrdersDetails                = "\(MAINURL)getOrdersDetails"
    static let korderStatusUpdate               = "\(MAINURL)orderStatusUpdate"
    static let kgetRestaurentNotificationList   = "\(MAINURL)getRestaurentNotificationList"
    static let ksendVoucher                     = "\(MAINURL)sendVoucher"
    static let kgetVoucher                      = "\(MAINURL)getVouchers"
    static let ksendHelpSupport                 = "\(MAINURL)helpSupport"
    static let kchangePassword                 = "\(MAINURL)changePassword"
    
    // logout
    static let klogOut                          = "\(MAINURL)logout"
    
    //static let kgetEphemeralkey                 = "\(MAINURL)common/getEphemeralkey"
    
    
}
