//
//  EPAlertViewController.swift
//  DemoTableView
//
//  Created by Rajat Lala on 14/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    class func showAlert(withTitle alertTitle: String, alertMessage: String, buttonArray: NSArray, completion: ((_ buttonIndex : Int) -> ())? = nil){
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        for i in 0..<buttonArray.count {
            let alertButton = UIAlertAction(title: (buttonArray[i] as! String), style: .default, handler: { UIAlertAction in
                
                completion!(i)
                
                alertController.dismiss(animated: true, completion: {
                    
                })
            })
            
            alertController.addAction(alertButton)
        }
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            // present the view controller
            topController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
