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
