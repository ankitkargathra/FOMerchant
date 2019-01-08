//
//  TextField.swift
//  DemoTableView
//
//  Created by Rajat Lala on 11/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

class EPTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setProperties(strfontName: "Myriad pro-Regular", fontSize: 17.0)
    }
    
    func setProperties(strfontName:String,fontSize:CGFloat) {
        self.font = UIFont(name:strfontName, size: fontSize)!
        self.font = self.font?.withSize(17.0)
        self.textAlignment = .left
        self.placeholder = ""
        self.textColor = UIColor.black
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        self.setProperties()
    }
}
extension UITextField{
    
    func validateCreditCardFormat()-> (type: CardType, valid: Bool) {
        // Get only numbers from the input string
        let input = self.text!
        let numberOnly = input.replacingOccurrences(of:"[^0-9]", with: "", options: .regularExpression)
        var type: CardType = .Unknown
        var formatted = ""
        var valid = false
        
        // detect card type
        for card in CardType.allCards {
            if (matchesRegex(regex: card.regex, text: numberOnly)) {
                type = card
                break
            }
        }
        
        // check validity
        valid = luhnCheck(number: numberOnly)
        
        // format
        var formatted4 = ""
        for character in numberOnly {
            if formatted4.count == 4 {
                formatted += formatted4 + " "
                formatted4 = ""
            }
            formatted4.append(character)
        }
        
        formatted += formatted4 // the rest
        
        // return the tuple
        return (type, valid)
    }
    
    func matchesRegex(regex: String!, text: String!) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [.caseInsensitive])
            let nsString = text as NSString
            let match = regex.firstMatch(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return (match != nil)
        } catch {
            return false
        }
    }
    
    func luhnCheck(number: String) -> Bool {
        var sum = 0
        let digitStrings = number.reversed().map { String($0) }
        
        for tuple in digitStrings.enumerated() {
            guard let digit = Int(tuple.element) else { return false }
            let odd = tuple.0 % 2 == 1
            
            switch (odd, digit) {
            case (true, 9):
                sum += 9
            case (true, 0...8):
                sum += (digit * 2) % 9
            default:
                sum += digit
            }
        }
        
        return sum % 10 == 0
    }
}
