//
//  File.swift
//  DemoTableView
//
//  Created by Rajat Lala on 13/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

public let kAppName                 = "EPOP"
public let DEFAULT_ERROR_MESSAGE    = "Something went wrong"
public let DEFAULT_NO_NETWORK       = "The Internet conections appear to be offline."
public let DEFAULT_ADDRESS_VALID    = "Please enter Address"

let AppDel               = UIApplication.shared.delegate as! AppDelegate
let kPresentedViewHeight = UIScreen.main.bounds.size.height
let kPresentedViewWidth  = UIScreen.main.bounds.size.width
let kDeviceFrame         = AppDel.window!.bounds

let IS_iPHONE_5S        = UIScreen.main.bounds.size.height == 568 ? true : false as Bool
let IS_iPHONE_6         = UIScreen.main.bounds.size.height == 667 ? true : false as Bool
let IS_iPHONE_6_plus    = UIScreen.main.bounds.size.height == 736 ? true : false as Bool
let IS_iPHONE_X         = UIScreen.main.nativeBounds.height == 812 ? true : false as Bool
let IS_iPHONE_XS        = UIScreen.main.nativeBounds.height == 812 ? true : false as Bool
let IS_iPHONE_XS_MAX    = UIScreen.main.nativeBounds.height == 896 ? true : false as Bool
let IS_iPHONE_XR        = UIScreen.main.nativeBounds.height == 597.33 ? true : false as Bool
let IS_iPad_12          = UIScreen.main.bounds.size.height == 1024 ? true : false as Bool
let IS_iPad_10          = UIScreen.main.bounds.size.height == 834 ? true : false as Bool
let IS_iPad_9           = UIScreen.main.bounds.size.height == 768 ? true : false as Bool
let IS_iPad_mini        = UIScreen.main.bounds.size.height == 768 ? true : false as Bool

//2436x1125-pixel resolution at 458 ppi XS
//2688x1242-pixel resolution at 458 ppi XS_MAX
//1792x828-pixel resolution at 326 ppi  XR


let device_id           = UIDevice.current.identifierForVendor!.uuidString
let kYES                                = "YES"
let kNO                                 = "NO"
typealias INT_JSON = Int32


struct EPConstant {

    struct Intro {

        //IntroScreen
        static let INTRO_HEADER_1    = "Order Management Made Easy"
        static let INTRO_HEADER_2    = "Order Updates Made Easy"
        static let INTRO_HEADER_3    = "Notify Your Customers"
        static let INTRO_DES_1       = "Let your customer order food at their convinience from their phones and receives all order information on the app including food items, customer details, payment mode."
        static let INTRO_DES_2       = "We have made the order status updates to your customers easy as you like it.Now with just a tap accept a new order and with another tap let your users knows that their order is ready."
        static let INTRO_DES_3       = "Now reach with your existing and potential customers right from the app. send them a lip smacking offer or invite them to a special event. Filtered out only targeted users so you won't spam the people who are not supposed to receive your messages."
    }
    
    struct IntroImage {
        static let INTRO_IMG_1 = #imageLiteral(resourceName: "slide_1")
        static let INTRO_IMG_2 = #imageLiteral(resourceName: "slide_2")
        static let INTRO_IMG_3 = #imageLiteral(resourceName: "slide_3")
    }
    
    struct FORGOTPASSWORD {
        
        static let DESCRIPTION       = "Requesting to enter email address you used while register and you receive a link to reset your password in mail."
        
    }
    
    struct words {
        
        //Login
        static let FIELD_BLANK = ""
        static let ENTER_USERNAME = ""
        static let ENTER_PASSWORD = ""
        static let USERNAME_INCORRECT = ""
        static let PASSWORD_INCORRECT = ""
        static let ENTER_VALID_PASSWORD = ""
        static let ENTER_SUCCESS_LOGIN = ""
        
        //Forgot password
        static let ENTER_VALID_EMAIL = ""
        static let ENTER_SUCCESS_MAIL_SENT = ""
        
        //logout
        static let LOG_OUT             = "Logout"
        static let ARE_YOU_SURE        = "Are You Sure?"
        static let LOGGING_OUT_MESSAGE = "You will be logging out"
        
        //Button Text
    }
    
    struct URL {
    
        static let LOGIN_URL = ""
        static let FORGOT_PASSWORD_URL = ""
        static let LOG_OUT_URL = ""
    }
    
    struct Notification {
    
        
    }
    
    struct Colors {

    static let ORANGE_COLOR_THEME : UIColor  = UIColor(red: 255/255, green: 126/255, blue: 53/255, alpha: 1)
    static let GREEN_COLOR_THEME : UIColor   = UIColor(red: 1/255, green: 180/255, blue: 95/255, alpha: 1)
    static let BLACK_COLOR_THEME : UIColor   = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    static let RED_COLOR_THEME : UIColor     = UIColor(red: 255/255, green: 13/255, blue: 36/255, alpha: 1)
    static let GREY_COLOR_THEME : UIColor    = UIColor(red: 96/255, green: 106/255, blue: 116/255, alpha: 1)
    static let TEXT_GREY_THEME : UIColor    = UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1)
    }
    
    struct Keys {
        
    }
    
    struct Storyboard {
        
        static let AuthenticationStoryboard        = UIStoryboard(name: "Authentication", bundle: nil)
        static let MainStoryboard                  = UIStoryboard(name: "Main", bundle: nil)
        static let CardDetail                      = UIStoryboard(name: "CardDetail", bundle: nil)
        static let NotificationSummary             = UIStoryboard(name: "NotificationSummary", bundle: nil)
        static let AuthenticationStoryboard_ipad   = UIStoryboard(name: "Authentication_iPad", bundle: nil)
    }
    
    struct ViewControllerIdentifiers {
        
        //iPhone
       static let kIntroViewController                          = "ViewController"
       static let kLoginViewController                          = "LoginViewController"
       static let kforgotViewController                         = "ForgotPasswordViewController"
       static let kSideMenuController                           = "SideMenuViewController"
       static let kMainViewController                           = "MainViewController"
       static let kNotificationListViewController               = "NotificationListViewController"
       static let kNewNotificationViewcontroller                = "NewNotificationViewcontroller"
       static let kAccountSettingsViewController                = "AccountSettingsViewController"
       static let kRequestOrderViewController                   = "RequestOrderViewController"
       static let kPendingOrderViewController                   = "PendingOrderViewController"
       static let kPastOrderViewController                      = "PastOrderViewController"
       static let kDetailsOrderViewController                   = "DetailsOrderViewController"
       static let kSendNewNotificationDetailViewController      = "SendNewNotificationDetailViewController"
       static let kOtherFromSideMenuViewController              = "OtherFromSideMenuViewController"
       static let kCardDetailViewController                     = "CardDetailViewController"
       static let kNotificationSummaryViewController            = "NotificationSummaryViewController"
        //ipad
       static let kiPadLoginViewController                      = "iPadLoginViewController"
    }
    
    struct LoginKey
    {
        static let email        = "email"
        static let password     = "password"
        static let usertype     = "usertype"
    }
    struct UpdateProfileKey
    {
        static let name             = "restaurant_name"
        static let phone            = "restaurant_phone"
        static let address          = "restaurant_address"
        static let restrutantId     = "restaurent_id"
        static let id               = "id"
    }
    struct RestaurantStatusKey
    {
        static let restaurentId    = "restaurent_id"
        static let status          = "status"
        static let open            = "open"
    }
    struct GetOrderKey
    {
        static let restaurentId    = "restaurent_id"
        static let orderstatus     = "order_status"
        static let orderId         = "order_id"
    }
    struct GetOrderStatusUpdateKey
    {
        static let userId          = "user_id"
        static let orderId         = "order_id"
        static let status          = "status"
    }
    struct GetRestaurentNotificationListKey
    {
        static let restrutantId    = "restuarent_id"
    }
    struct SendVoucerKey
    {
        static let restrutantId    = "restuarent_id"
        static let to              = "to"
        static let msg             = "msg"
        static let offer           = "offer"
    }
    struct LogoutKey
    {
        static let userId    = "user_id"
    }
}
