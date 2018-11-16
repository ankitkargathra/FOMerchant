//
//  Extension.swift
//  DemoTableView
//
//  Created by Rajat Lala on 13/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func dateComponents(components: Set<Calendar.Component> = [.day, .month, .year]) -> DateComponents {
        let calendar = Calendar.current
        return calendar.dateComponents(components, from: self)
    }
    
    func dateString(withFormat format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
