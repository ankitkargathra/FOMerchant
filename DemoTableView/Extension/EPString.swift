//
//  EPString.swift
//  DemoTableView
//
//  Created by Rajat Lala on 14/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func date(withFormat format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    func dateComponents(withFormat format: String = "yyyy-MM-dd", components: Set<Calendar.Component> = [.day, .month, .year]) -> DateComponents? {
        return self.date(withFormat: format)?.dateComponents(components: components)
    }
    
    func isBackSpace() -> Bool{
        let  char = self.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            return true
        }
        
        return false
    }
    
    func isBlank() -> Bool{
        return self.count == 0 ? true : false
    }
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func trimSpecialCharacter() -> String{
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
     func ConvertToJsonString(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func add$Tag() -> String {
        return "$" + self
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}
