//
//  EPView.swift
//  DemoTableView
//
//  Created by Rajat Lala on 14/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setProperties() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
     func initializeAnActivityIndicator(view: UIView) -> UIActivityIndicatorView {
        let actvitiyIndicator = UIActivityIndicatorView()
        actvitiyIndicator.activityIndicatorViewStyle = .gray
        actvitiyIndicator.center = view.center
        actvitiyIndicator.hidesWhenStopped = true
        return actvitiyIndicator
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
