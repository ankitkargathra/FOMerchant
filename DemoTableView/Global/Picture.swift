//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 29, 2018

import Foundation


class Picture{

    var id : String!
    var picture : String!
    var restaurantId : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func ParseDict(fromDictionary dictionary: JSONDICTIONARY){
        id = dictionary["id"] as? String
        picture = dictionary["picture"] as? String
        restaurantId = dictionary["restaurant_id"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> JSONDICTIONARY
    {
        var dictionary = JSONDICTIONARY()
        if id != nil{
            dictionary["id"] = id
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        if restaurantId != nil{
            dictionary["restaurant_id"] = restaurantId
        }
        return dictionary
    }
}
