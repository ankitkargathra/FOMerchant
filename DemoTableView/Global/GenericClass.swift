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

        let deviceId:String = UUID().uuidString
        ApiController.sharedInstace.loginUser(login: Login.init(email: email, password: password, usertype: userType, deviceId: deviceId), completionHandler: { (isResult, message, dictionary) in
            if isResult{
              UserDefaults.standard.set(deviceId, forKey: "devicesId")
              UserDefaults.standard.synchronize()
                completion(true, message, dictionary)
            }else{completion(false, "",nil)}
        })
    }
    
    func CallForgotPasswordApi(email : String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.forgotPassword(forgotPassword: ForgotPassword.init(email: email), completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, "", nil)}
        })
    }
    
    
    func CallgetProfileApi(id : String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getUserProfile(parameters: ["id":id], completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallUpdateProfileApi(name : String, phone:String, address:String, picture:UIImage, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {

        ApiController.sharedInstace.updateBasicProfile(basicProfile: updateRestaurentProfile.init(name: name, phone: phone, address: address), picture: picture, completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallgetRestuarantImagesApi(id : String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getRestrutantImages(parameters: ["id":id], completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallRestaurentStatusUpdateApi(restaurentId : String, status:String, open:String!, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.restaurentStatusUpdate(restaurentStatus: RestrutantStatus.init(restaurentId: restaurentId, status: status, open: open), completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, "", nil)}
        })
    }
    
    func CallAddRestrutantPictureApi(restrutantId : String, picture:UIImage, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.addRestrutantPicture(addPicture: addRestaurentPicture.init(id: restrutantId), picture: picture, completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallRemoveRestrutantPictureApi(id : String,  completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        ApiController.sharedInstace.removeRestrutantPicture(RemovePicture: RemoveRestaurentPicture.init(id: id), completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallGetOrderApi(restaurentId : String, orderStatus:String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getOrders(getorder: GetOrders.init(restaurentId: restaurentId, orderStatus: orderStatus), completionHandler:{ (isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    func CallGetOrderStatusUpdateApi(userId : String, orderId:String, status:String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getOrderStatusUpdate(getorderstatusupdate: GetOrderStatusUpdate.init(userId: userId, orderId: orderId, status: status),  completionHandler:{ (isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallGetOrderDetailsApi(orderId : String, restaurentId:String, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getOrdersDetails(getorderdetail: GetOrdersDetails.init(orderId: orderId, restaurentId:restaurentId),completionHandler:{ (isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallGetRestaurentNotificationListApi(restaurentId : String, completion: @escaping (_ isSuccess: Bool,_ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.getRestaurentNotificationList(getrestaurentnotificationlist: GetRestaurentNotificationList.init(restaurentId: restaurentId), completionHandler:{ (isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallSendVoucerApi(restaurentId : String,to : String,msg : String,offer : String, completion: @escaping (_ isSuccess: Bool,_ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.sendVoucer(sendvoucer: SendVoucer.init(restaurentId: restaurentId, to: to, msg: msg, offer: offer), completionHandler: {(isResult, message, dictionary) in
            
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func LogoutApi(deviceId : String, completion: @escaping (_ isSuccess: Bool,_ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        
        ApiController.sharedInstace.logOut(logout: Logout.init(deviceId: deviceId), completionHandler: {(isResult, message, dictionary) in
            
            if isResult
            {
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        })
    }
    
    func CallHelpSupportApi(topic:String, message:String!, completion: @escaping (_ isSuccess: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> ()) {
        let params = ["topic":topic, "message":message] as JSONDICTIONARY
        ApiController.sharedInstace.SendHelpSupport(parameter: params, completionHandler: { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, "", nil)}
        })
    }
    
    func CallGetRestaurentVouchersListApi(restaurentId : String!, completion: @escaping (_ isSuccess: Bool,_ message: String, _ returnData: JSONDICTIONARY?) -> ()){
        
        let params = ["restaurentId":restaurentId] as JSONDICTIONARY
        ApiController.sharedInstace.getVoucher(parameter: params) { (isResult, message, dictionary) in
            if isResult{
                completion(true, message, dictionary)
            }else{completion(false, message, dictionary)}
        }
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
    
    func dashedBorderLayerWithColor(color:CGColor, view:UIView) -> CAShapeLayer {
        
        let  borderLayer = CAShapeLayer()
        borderLayer.name  = "borderLayer"
        let frameSize = view.frame.size
        let shapeRect = CGRect(x:0, y:0, width:frameSize.width, height:frameSize.height)
        
        borderLayer.bounds=shapeRect
        borderLayer.position = CGPoint(x:frameSize.width/2, y:frameSize.height/2)
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color
        borderLayer.lineWidth=1
        borderLayer.lineJoin=kCALineJoinRound
        borderLayer.lineDashPattern = NSArray(array: [NSNumber(value: 8),NSNumber(value:4)]) as? [NSNumber]
        
        let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: 5)
        
        borderLayer.path = path.cgPath
        
        return borderLayer
        
    }
    
    class func getFormattedDateTime(secondss : Double, isPastListing:Bool = false, NotificationHeader:Bool = false, NotificationOffer:Bool = false) -> String {
        //secondss is in miliseconds so divided by 1000
        let seconds = secondss / 1000
        let tDate = Date(timeIntervalSince1970: seconds)
        if isPastListing{
            var str = ""
            let dateFormatter = DateFormatter()
            var dateFormat = ""
            dateFormat = DATE_FORMAT
            dateFormatter.dateFormat = dateFormat
            str = "\(dateFormatter.string(from: tDate))"
            return str
        }else if NotificationHeader{
            let calendar = Calendar.current
            let anchorComponents = calendar.dateComponents([.day, .month, .year], from: tDate)
            
            // Formate
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = DATE_FORMAT_NOTI_HEAD
            let newDate = dateFormate.string(from: tDate)
            
            var day  = "\(anchorComponents.day!)"
            switch (day) {
            case "1" , "21" , "31":
                day.append("st")
            case "2" , "22":
                day.append("nd")
            case "3" ,"23":
                day.append("rd")
            default:
                day.append("th")
            }
            return day + " " + newDate
            
        }else if NotificationOffer{
            var str = ""
            let dateFormatter = DateFormatter()
            var dateFormat = ""
            dateFormat = DATE_FORMAT_NOTI_OFFER
            dateFormatter.dateFormat = dateFormat
            str = "\(dateFormatter.string(from: tDate))"
            return str
        }else{
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let userPostDate: Date? = tDate//df.date(from: tDate)
            
            let currentDate = Date()
            var distanceBetweenDates: TimeInterval? = nil
            if let aDate = userPostDate {
                distanceBetweenDates = currentDate.timeIntervalSince(aDate)
            }
            
            let theTimeInterval: TimeInterval? = distanceBetweenDates
            
            // Get the system calendar
            let sysCalendar = Calendar.current
            
            // Create the NSDates
            let date1 = Date()
            let date2 = Date(timeInterval: theTimeInterval ?? 0.0, since: date1)
            
            // Get conversion to months, days, hours, minutes
            let unitFlags: Set<Calendar.Component> = [.hour, .minute, .day, .month, .second, .year]
            let conversionInfo = sysCalendar.dateComponents(unitFlags, from: date1, to: date2)
            
            var returnDate = ""
            if conversionInfo.year! > 0 {
                returnDate = String(format: "%ld year(s) ago", conversionInfo.year!)
            }
            else if conversionInfo.month! > 0 {
                returnDate = String(format: "%ld month(s) ago", conversionInfo.month!)
            } else if conversionInfo.day! > 0 {
                returnDate = String(format: "%ld day(s) ago", conversionInfo.day!)
            } else if conversionInfo.hour! > 0 {
                returnDate = String(format: "%ld hour(s) ago", conversionInfo.hour!)
            } else if conversionInfo.minute! > 0 {
                returnDate = String(format: "%ld mintue(s) ago", conversionInfo.minute!)
            } else {
                returnDate = "Few seconds ago"
            }
            
            return returnDate
        }
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

