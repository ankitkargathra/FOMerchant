//
//  UserRootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 24, 2018

import Foundation


class UserRootClass {

    static let shared:UserRootClass = UserRootClass()
    
    var accessToken : String!
    var address : String!
    var email : String!
    var fullname : String!
    var id : String!
    var isActive : String!
    var isConfirm : String!
    var isDelete : String!
    var isOpen : String!
    var phone : String!
    var picture : String!
    var selfService : String!
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    func parseDict(fromDictionary dictionary: [String:Any]){
       
        accessToken = dictionary["access_token"] as? String
        address = dictionary["address"] as? String
        email = dictionary["email"] as? String
        fullname = dictionary["fullname"] as? String
        id = dictionary["id"] as? String
        isActive = dictionary["is_active"] as? String
        isConfirm = dictionary["is_confirm"] as? String
        isDelete = dictionary["is_delete"] as? String
        isOpen = dictionary["is_open"] as? String
        phone = dictionary["phone"] as? String
        picture = dictionary["picture"] as? String
        selfService = dictionary["self_service"] as? String
        
    }

    func saveToDefaults()
    {
        UserDefaults.standard.set(toDictionary(), forKey: "userData")
        UserDefaults.standard.synchronize()
    }
    
    func getAuth() -> [String:String] {
        return ["accesstoken":"\(self.accessToken!)"]
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if accessToken != nil{
            dictionary["access_token"] = accessToken
        }
        if address != nil{
            dictionary["address"] = address
        }
        if email != nil{
            dictionary["email"] = email
        }
        if fullname != nil{
            dictionary["fullname"] = fullname
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isActive != nil{
            dictionary["is_active"] = isActive
        }
        if isConfirm != nil{
            dictionary["is_confirm"] = isConfirm
        }
        if isDelete != nil{
            dictionary["is_delete"] = isDelete
        }
        if isOpen != nil{
            dictionary["is_open"] = isOpen
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        if selfService != nil{
            dictionary["self_service"] = selfService
        }
        return dictionary
    }
    func clearUserData()
    {
        UserDefaults.standard.removeObject(forKey: "userData")
        UserDefaults.standard.synchronize()
    }
}
