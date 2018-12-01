//
//  UserRootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 24, 2018

import Foundation


class UserRootClass {

    static let shared:UserRootClass = UserRootClass()
    
    var id:String!
    var accessToken : String!
    var email : String!
    var isActive : String!
    var isConfirm : String!
    var isDelete : String!
    var isOpen : String!
    
    var restaurantAddress : String!
    var restaurantName : String!
    var restaurantPhone : String!
    var restaurantPicture : String!
    var selfService : String!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    func parseDict(fromDictionary dictionary: [String:Any]){
       
        id = dictionary["restaurant_id"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurantPhone = dictionary["restaurant_phone"] as? String
        restaurantAddress = dictionary["restaurant_address"] as? String
        restaurantPicture = dictionary["picture"] as? String
        isOpen = dictionary["is_open"] as? String
        selfService = dictionary["self_service"] as? String
        
        
        accessToken = dictionary["access_token"] as? String
        email = dictionary["email"] as? String
        isActive = dictionary["is_active"] as? String
        isConfirm = dictionary["is_confirm"] as? String
        isDelete = dictionary["is_delete"] as? String
    }

    func saveToDefaults()
    {
        UserDefaults.standard.set(toDictionary(), forKey: "userData")
        UserDefaults.standard.synchronize()
    }
    
    func getAuth() -> [String:String] {
        return ["Authorization":"Bearer \(self.accessToken!)"]
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
     
        if id != nil{
            dictionary["restaurant_id"] = id
        }
        if accessToken != nil{
            dictionary["access_token"] = accessToken
        }
        if email != nil{
            dictionary["email"] = email
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
        
        if restaurantAddress != nil{
            dictionary["restaurant_address"] = restaurantAddress
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if restaurantPhone != nil{
            dictionary["restaurant_phone"] = restaurantPhone
        }
        if restaurantPicture != nil{
            dictionary["picture"] = restaurantPicture
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
