//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 24, 2018

import Foundation

class NotificationListRootClass{
    
    var data : [NotificationListData]!
    var message : String!
    var status : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func ParseDict(fromDictionary arr: [[String:Any]]){
        data = [NotificationListData]()
        for dic in arr{
            let value = NotificationListData(fromDictionary: dic)
            data.append(value)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
            var dictionaryElements = [[String:Any]]()
            for dataElement in data {
                dictionaryElements.append(dataElement.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }
        return dictionary
    }
}


class NotificationListData{

    var amount : String!
    var createdAt : String!
    var descriptionField : String!
    var discount : String!
    var endDate : String!
    var id : String!
    var isDelete : String!
    var isPaid : String!
    var notification : String!
    var notificationType : String!
    var quantity : String!
    var restaurentId : String!
    var sentTo : String!
    var startDate : String!
    var updatedAt : String!
    var userSent : String!
    var voucherCode : String!
    var voucherId : String!
    var voucherName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        amount = dictionary["amount"] as? String
        createdAt = dictionary["created_at"] as? String
        descriptionField = dictionary["description"] as? String
        discount = dictionary["discount"] as? String
        endDate = dictionary["end_date"] as? String
        id = dictionary["id"] as? String
        isDelete = dictionary["is_delete"] as? String
        isPaid = dictionary["is_paid"] as? String
        notification = dictionary["notification"] as? String
        notificationType = dictionary["notification_type"] as? String
        quantity = dictionary["quantity"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
        sentTo = dictionary["sent_to"] as? String
        startDate = dictionary["start_date"] as? String
        updatedAt = dictionary["updated_at"] as? String
        userSent = dictionary["user_sent"] as? String
        voucherCode = dictionary["voucher_code"] as? String
        voucherId = dictionary["voucher_id"] as? String
        voucherName = dictionary["voucher_name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if amount != nil{
            dictionary["amount"] = amount
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if discount != nil{
            dictionary["discount"] = discount
        }
        if endDate != nil{
            dictionary["end_date"] = endDate
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isDelete != nil{
            dictionary["is_delete"] = isDelete
        }
        if isPaid != nil{
            dictionary["is_paid"] = isPaid
        }
        if notification != nil{
            dictionary["notification"] = notification
        }
        if notificationType != nil{
            dictionary["notification_type"] = notificationType
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        if restaurentId != nil{
            dictionary["restaurent_id"] = restaurentId
        }
        if sentTo != nil{
            dictionary["sent_to"] = sentTo
        }
        if startDate != nil{
            dictionary["start_date"] = startDate
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userSent != nil{
            dictionary["user_sent"] = userSent
        }
        if voucherCode != nil{
            dictionary["voucher_code"] = voucherCode
        }
        if voucherId != nil{
            dictionary["voucher_id"] = voucherId
        }
        if voucherName != nil{
            dictionary["voucher_name"] = voucherName
        }
        return dictionary
    }
}
