//
//  OrderList.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 13, 2018

import Foundation


class OrderList{

    var addOnName : AnyObject!
    var customization : String!
    var customizationPrice : String!
    var customizationValue : String!
    var itemAddOnPrice : AnyObject!
    var itemName : String!
    var itemPrice : String!
    var quantity : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        addOnName = dictionary["add_on_name"] as? AnyObject
        customization = dictionary["customization"] as? String
        customizationPrice = dictionary["customization_price"] as? String
        customizationValue = dictionary["customization_value"] as? String
        itemAddOnPrice = dictionary["item_add_on_price"] as? AnyObject
        itemName = dictionary["item_name"] as? String
        itemPrice = dictionary["item_price"] as? String
        quantity = dictionary["quantity"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if addOnName != nil{
            dictionary["add_on_name"] = addOnName
        }
        if customization != nil{
            dictionary["customization"] = customization
        }
        if customizationPrice != nil{
            dictionary["customization_price"] = customizationPrice
        }
        if customizationValue != nil{
            dictionary["customization_value"] = customizationValue
        }
        if itemAddOnPrice != nil{
            dictionary["item_add_on_price"] = itemAddOnPrice
        }
        if itemName != nil{
            dictionary["item_name"] = itemName
        }
        if itemPrice != nil{
            dictionary["item_price"] = itemPrice
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        return dictionary
    }
}
