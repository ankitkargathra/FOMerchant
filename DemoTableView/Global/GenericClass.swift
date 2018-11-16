//
//  Helper.swift
//  DemoTableView
//
//  Created by Rajat Lala on 13/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

class GenericClass: BaseViewController {

    static let sharedInstance = GenericClass()
    

    //MARK:-  Api methods
    
    func CallSignInApi(email : String,password : String,userType : String,completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        ApiController.sharedInstace.loginUser(login: Login.init(email: email, password: password, usertype: userType), completionHandler: { (isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, "",nil)}
        })
    }
    
    func CallForgotPasswordApi(email : String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.forgotPassword(forgotPassword: ForgotPassword.init(email: email), completionHandler: { (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true, message, dictionary)
            }else{completion(false, "", nil)}
        })
    }
    
    func CallUpdateProfileApi(name : String, phone:String, address:String, picture:UIImage, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.updateBasicProfile(basicProfile: updateRestaurentProfile.init(name: name, phone: phone, address: address), picture: picture, completionHandler: { (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallAddRestrutantPictureApi(restrutantId : String, picture:UIImage, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.addRestrutantPicture(addPicture: addRestaurentPicture.init(id: restrutantId), picture: picture, completionHandler: { (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallRemoveRestrutantPictureApi(id : String, picture:UIImage, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.removeRestrutantPicture(RemovePicture: RemoveRestaurentPicture.init(id: id), picture: picture, completionHandler: { (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallRestaurentStatusUpdateApi(restaurentId : String, status:String,open:String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.restaurentStatusUpdate(restaurentStatus: RestrutantStatus.init(restaurentId: restaurentId, status: status, open: open), completionHandler: { (isResult, message, dictionary) in

            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallGetOrderApi(restaurentId : String, orderStatus:String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.getOrders(getorder: GetOrders.init(restaurentId: restaurentId, orderStatus: orderStatus), completionHandler:{ (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallGetOrderDetailsApi(orderId : String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.getOrdersDetails(getorderdetail: GetOrdersDetails.init(orderId: orderId),completionHandler:{ (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallGetOrderStatusUpdateApi(userId : String, orderId:String, status:String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.getOrderStatusUpdate(getorderstatusupdate: GetOrderStatusUpdate.init(userId: userId, orderId: orderId, status: status), completionHandler:{ (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallGetRestaurentNotificationListApi(restaurentId : String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.getRestaurentNotificationList(getrestaurentnotificationlist: GetRestaurentNotificationList.init(restaurentId: restaurentId), completionHandler:{ (isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func CallSendVoucerApi(restaurentId : String,to : String,msg : String,offer : String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.sendVoucer(sendvoucer: SendVoucer.init(restaurentId: restaurentId, to: to, msg: msg, offer: offer), completionHandler: {(isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func LogoutApi(userId : String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        ApiController.sharedInstace.logOut(logout: Logout.init(userId: userId), completionHandler: {(isResult, message, dictionary) in
            
            if isResult
            {
                completion(true)
                if let responseDict = dictionary
                {
                    if responseDict["message"] != nil
                    {
                        self.showToast(msg: responseDict["message"] as! String)
                    }
                }
            }else{completion(false)}
        })
    }
    
    func iPhoneX()->Bool
    {
        if UIDevice().userInterfaceIdiom == .phone
        {
            switch UIScreen.main.nativeBounds.height
            {
            case 1136:
                return false
            case 1334:
                return false
            case 1920, 2208:
                return false
            case 2436:
                return true
            default:
                return false
            }
        }
        return false
    }
    
    // MARK: - Get Proportional Type
    func getProportionalWidth(width:CGFloat) -> CGFloat {
        return ((Devices.screenWidth * width)/750)
    }
    func getProportionalHeight(height:CGFloat) -> CGFloat {
        let screenHeight = Devices.deviceType == .iPhoneX ? Devices.screenHeight - (44 + 34) : Devices.screenHeight
        return ((screenHeight * height) / (2208 / 3))
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

