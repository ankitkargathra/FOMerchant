//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 13, 2018

import Foundation


class RequestListRootClass{

    var data : [RequestListData]!
    var message : String!
    var status : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func ParseDict(fromDictionary arr: [[String:Any]]){
//        message = dictionary["message"] as? String
//        status = dictionary["status"] as? String
            data = [RequestListData]()
        
            for dic in arr{
                let value = RequestListData(fromDictionary: dic)
                data.append(value)
            }
        
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
//        if message != nil{
//            dictionary["message"] = message
//        }
//        if status != nil{
//            dictionary["status"] = status
//        }
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
