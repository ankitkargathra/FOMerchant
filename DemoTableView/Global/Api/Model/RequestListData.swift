//
//  Data.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 13, 2018

import Foundation


class RequestListData{

    var createdAt : Int!
    var fullname : String!
    var grandTotal : String!
    var id : String!
    var orderNumber : String!
    var orderQueue : String!
    var orderStatus : String!
    var orderList : [OrderList]!
    var specialCookingInstructions : String!
    var tableNumber : String!
    var paymentMethods : String!
    var toUserId:String!
    var tax:String!
    var subTotal:String!
 
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? Int
        fullname = dictionary["fullname"] as? String
        grandTotal = dictionary["grand_total"] as? String
        id = dictionary["id"] as? String
        orderNumber = dictionary["order_number"] as? String
        orderQueue = dictionary["order_queue"] as? String
        orderStatus = dictionary["order_status"] as? String
        specialCookingInstructions = dictionary["special_cooking_instructions"] as? String
        tableNumber = dictionary["table_number"] as? String
        paymentMethods = dictionary["payment_method"] as? String
        toUserId = dictionary["to_userId"] as? String
        tax = dictionary["tax"] as? String
        subTotal = dictionary["sub_total"] as? String
        orderList = [OrderList]()
        if let orderListArray = dictionary["orderList"] as? [[String:Any]]{
            for dic in orderListArray{
                let value = OrderList(fromDictionary: dic)
                orderList.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if fullname != nil{
            dictionary["fullname"] = fullname
        }
        if grandTotal != nil{
            dictionary["grand_total"] = grandTotal
        }
        if id != nil{
            dictionary["id"] = id
        }
        if orderNumber != nil{
            dictionary["order_number"] = orderNumber
        }
        if orderQueue != nil{
            dictionary["order_queue"] = orderQueue
        }
        if orderStatus != nil{
            dictionary["order_status"] = orderStatus
        }
        if specialCookingInstructions != nil{
            dictionary["special_cooking_instructions"] = specialCookingInstructions
        }
        if tableNumber != nil{
            dictionary["table_number"] = tableNumber
        }
        if paymentMethods != nil{
            dictionary["payment_method"] = paymentMethods
        }
        if toUserId != nil{
            dictionary["to_userId"]  = toUserId
        }
        if tax != nil{
            dictionary["tax"] = tax
        }
        if subTotal != nil{
            dictionary["sub_total"] = subTotal
        }
        if orderList != nil{
            var dictionaryElements = [[String:Any]]()
            for orderListElement in orderList {
                dictionaryElements.append(orderListElement.toDictionary())
            }
            dictionary["orderList"] = dictionaryElements
        }
        return dictionary
    }
}
