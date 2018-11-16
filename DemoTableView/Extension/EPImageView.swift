//
//  EPImageView.swift
//  DemoTableView
//
//  Created by Urja_Macbook on 16/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func addBlackGradientLayer(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        //gradient.opacity = 0.65
        self.layer.addSublayer(gradient)
    }
}

