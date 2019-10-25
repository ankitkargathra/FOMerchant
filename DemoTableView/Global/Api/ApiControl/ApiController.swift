//
//  ApiController.swift
//  Deals en Route Business
//
//  Created by Ankit on 11/27/17.
//  Copyright © 2017 Solulab. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SystemConfiguration
typealias JSONDICTIONARY = [String:Any]

class ApiController: BaseViewController {
    
    let kDeviceType = "iOS"
    var isLocalJson = false
    let kSystemVersion = UIDevice.current.systemVersion
    var hideLoader = false
    var showInView = false
    var message = ""
    static let sharedInstace: ApiController = ApiController()
    
    
    lazy var kAppVersion: String = {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }()
    
    lazy var kDeviceID: String = {
        return UIDevice.current.identifierForVendor!.uuidString
    }()
    
    
    
    //MARK: ****************
    
    func loginUser(login: Login, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.ksignin, methodType: .post, parameter: login.toJsonDictionary(), encoding: URLEncoding.default, header: false) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func forgotPassword(forgotPassword: ForgotPassword, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kforgotPassword, methodType: .post, parameter: forgotPassword.toJsonDictionary(), encoding: URLEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    func getUserProfile(parameters: JSONDICTIONARY!, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kgetRestaurentProfile, methodType: .post, parameter: parameters, encoding: URLEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    func getRestrutantImages(parameters: JSONDICTIONARY!, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kgetRestaurentImages, methodType: .post, parameter: parameters, encoding: URLEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    func updateBasicProfile(basicProfile: updateRestaurentProfile,picture : UIImage?, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        if picture != nil{
            self.uploadMultipartData(url: URLClass.kupdateRestaurentProfile, parameters: basicProfile.toJsonDictionary(), imgData: UIImageJPEGRepresentation(picture!, 0.5)!){ (result, message, response) in
                completionHandler(result, message, response as? JSONDICTIONARY)
            }
            return
        }
        
        callWebservice(url: URLClass.kupdateRestaurentProfile, methodType: .post, parameter: basicProfile.toJsonDictionary(), encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func addRestrutantPicture(addPicture: addRestaurentPicture, picture:UIImage, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        self.uploadMultipartDataInArr(url: URLClass.kaddRestaurentPictures, parameters: addPicture.toJsonDictionary(), picture:[picture]){ (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
            return
        }
    }
    
    func removeRestrutantPicture(RemovePicture: RemoveRestaurentPicture, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kremoveRestaurentPictures, methodType: .post, parameter: RemovePicture.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func restaurentStatusUpdate(restaurentStatus: RestrutantStatus, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.krestaurentStatusUpdate, methodType: .post, parameter: restaurentStatus.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    
    //MARK: ****************
    
    func getOrders(getorder: GetOrders, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kgetOrders, methodType: .post, parameter: getorder.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getOrdersDetails(getorderdetail: GetOrdersDetails, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kgetOrdersDetails, methodType: .post, parameter: getorderdetail.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getOrderStatusUpdate(getorderstatusupdate: GetOrderStatusUpdate, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.korderStatusUpdate, methodType: .post, parameter: getorderstatusupdate.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getRestaurentNotificationList(getrestaurentnotificationlist: GetRestaurentNotificationList, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kgetRestaurentNotificationList, methodType: .post, parameter: getrestaurentnotificationlist.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func sendVoucer(sendvoucer: SendVoucer, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.ksendVoucher, methodType: .post, parameter: sendvoucer.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func logOut(logout: Logout, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.klogOut, methodType: .post, parameter: logout.toJsonDictionary(), encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getVoucher(parameter: JSONDICTIONARY!, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kgetVoucher, methodType: .post, parameter: parameter, encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    func SendHelpSupport(parameter: JSONDICTIONARY!, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.ksendHelpSupport, methodType: .post, parameter: parameter, encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    func ChangePassword(oldPassword: String, newPassword: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        callWebservice(url: URLClass.kchangePassword, methodType: .post, parameter: ["old_password":oldPassword,"password":newPassword], encoding: URLEncoding.default, header: true) { (result, message, response) in
            
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    //MARK: ---------------
    
    func callWebservice(url: String, methodType: HTTPMethod, parameter: JSONDICTIONARY?, encoding: ParameterEncoding, header: Bool = true, completion: @escaping (_ result: Bool, _ message: String, _ returnData: Any?) -> ()) {
        
        
        if ReachabilityManual.shared.isConnectedToNetwork() {
            self.showHUD(str: message,showInView: self.showInView,hideLoader: self.hideLoader)
            Alamofire.request(url, method: methodType, parameters: parameter!, encoding: encoding, headers: header ? UserRootClass.shared.getAuth() : nil).responseJSON { (response) in
                
                DispatchQueue.main.async {
                    self.hideHUD()
                    if let data = response.result.value, let statusCode = response.response?.statusCode{
                        if statusCode == 200
                        {
                            completion(true,"",data)
                        } else
                        {
                            if let dict = data as? JSONDICTIONARY{
                                if dict["message"] != nil
                                {
                                    self.showToast(msg: dict["message"] as! String)
                                }
                            }
                            completion(false,"",nil)
                        }
                    }else{
                        print("Request \(response.request!)")
                        print("Request Params : \(parameter!)")
                        print("URL : \(url)")
                        //                        print("Response : \(response.result.value!)")
                        self.showToast(msg: DEFAULT_ERROR_MESSAGE)
                        completion(false,"",nil)
                    }
                }
            }
        }else{
            self.hideHUD()
            self.showToast(msg: DEFAULT_NO_NETWORK)
        }
        
    }
    
    func uploadMultipartData(url : String,parameters : [String  : Any],imgData : Data,completion: @escaping (_ result: Bool, _ message: String, _ returnData: Any?) -> ())
    {
        if ReachabilityManual.shared.isConnectedToNetwork() {
            self.showHUD(showInView: self.showInView,hideLoader: self.hideLoader)
            Alamofire.upload(multipartFormData:
                {
                    (multipartFormData) in
                    multipartFormData.append(imgData, withName: "picture", fileName: "file.jpeg", mimeType: "image/png")
                    for (key, value) in parameters
                    {
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
            }, to:url,headers:UserRootClass.shared.getAuth())
            { (result) in
                switch result {
                case .success(let upload,_,_ ):
                    upload.uploadProgress(closure: { (progress) in
                        // print("uploading...")
                    })
                    upload.responseJSON
                        { response in
                            //print response.result
                            
                            DispatchQueue.main.async {
                                self.hideHUD()
                                if let data = response.result.value, let statusCode = response.response?.statusCode
                                {
                                    if statusCode == 200
                                    {
                                        completion(true,"",data)
                                    } else
                                    {
                                        if let dict = data as? JSONDICTIONARY{
                                            if dict["message"] != nil
                                            {
                                                self.showAlert(msg: dict["message"] as! String)
                                            }
                                        }
                                        completion(false,"",nil)
                                    }
                                } else
                                {
                                    self.showAlert(msg: DEFAULT_ERROR_MESSAGE)
                                    completion(false,"",nil)
                                }
                            }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    self.hideHUD()
                    break
                }
            }
        }else{
            self.hideHUD()
            self.showToast(msg: DEFAULT_NO_NETWORK)
        }
        
    }
    
    func uploadMultipartDataInArr(url : String,parameters : [String  : Any], picture:[UIImage], completion: @escaping (_ result: Bool, _ message: String, _ returnData: Any?) -> ())
    {
        if ReachabilityManual.shared.isConnectedToNetwork() {
            self.showHUD(showInView: self.showInView,hideLoader: self.hideLoader)
            Alamofire.upload(multipartFormData:{
                (multipartFormData) in
                if let imArr = picture as? [UIImage]{
                    for img in imArr{
                        multipartFormData.append(UIImageJPEGRepresentation(img, 0.5)!, withName: "picture[]", fileName: "file.jpeg", mimeType: "image/png")
                    }
                }
                for (key, value) in parameters{
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to:url,headers:UserRootClass.shared.getAuth())
            { (result) in
                switch result {
                case .success(let upload,_,_ ):
                    upload.uploadProgress(closure: { (progress) in
                        // print("uploading...")
                    })
                    upload.responseString(completionHandler: { response in
                        
                        DispatchQueue.main.async {
                            self.hideHUD()
                            if let data = response.result.value, let statusCode = response.response?.statusCode
                            {
                                if statusCode == 200
                                {
                                    completion(true,"",data)
                                } else
                                {
                                    if let dict = data as? JSONDICTIONARY{
                                        if dict["message"] != nil
                                        {
                                            self.showAlert(msg: dict["message"] as! String)
                                        }
                                    }
                                    completion(false,"",nil)
                                }
                            } else
                            {
                                self.showAlert(msg: DEFAULT_ERROR_MESSAGE)
                                completion(false,"",nil)
                            }
                        }
                    })
                case .failure(let encodingError):
                    print(encodingError)
                    self.hideHUD()
                    break
                }
            }
        }else{
            self.hideHUD()
            self.showToast(msg: DEFAULT_NO_NETWORK)
        }
        
    }
    
    func showAlert(msg : String)
    {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Local Api response Method
    
    func callLocalApiResponse(name: String) -> Any? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as Any
            } catch {
                // handle error
            }
        }
        return nil
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

public class ReachabilityManual {
    static let shared: ReachabilityManual = ReachabilityManual()
    
    public func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        if flags.isEmpty {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
