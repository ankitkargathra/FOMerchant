//
//  Font.swift
//  comon
//
//  Created by Ankit on 28/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

public let AvenirNextLTPro_Demi = "AvenirNextLTPro-Demi"//"Avenir Next LT Pro Demi"
public let AvenirNextLTPro_Medium     = "AvenirNextLTPro-Medium"//"Avenir Next LT Pro Medium"

enum FontType: String {
    case Regular = "Regular"
    case Bold = "Bold"
    case Light = "Light"
    case NeueLight = "Lt"
    case NeueBold = "Bd"
}


func getProportionalFont(size:CGFloat) -> CGFloat {
    // As per 6 Plus
    if Devices.isIphone{
        if Devices.screenHeight <= 2208/3 {
            return ((Devices.screenHeight * size) / (2208 / 3))
        }else{
            return ((Devices.screenHeight * size) / (2688 / 3))
        }
    }
    else{
        return ((Devices.screenHeight * size) / (2048 / 2))
    }
    
}

class Font {
    
    static func setFont(name: String, size: CGFloat) -> UIFont? {
        return UIFont.init(name: name, size: size)
    }
    
    static func setFontAttribute(font: UIFont) -> [NSAttributedStringKey : Any] {
        return [
            NSAttributedStringKey.font : font,
        ]
    }

}
