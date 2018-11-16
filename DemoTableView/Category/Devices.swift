//
//  Devices.swift
//  Vachnamrut
//
//  Created by Bhautik Ziniya on 9/14/17.
//  Copyright © 2017 Agile Infoways. All rights reserved.
//

import UIKit

class Devices: NSObject {
    
    internal enum DeviceType {
        case iPhone5s
        case iPhone6or6s
        case iPhone6por6sp
        case iPhoneX
        case iPhoneXS
        case iPhoneXR
        case iPhoneXS_MAX
        case iPadPro_12
        case iPadPro_10
        case iPad_9
        case iPad_Mini
        // till 2019 september support
    }
    
    // MARK: - Device is iPad
    static var isIpad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    // MARK: - Device is iPhone
    static var isIphone : Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    // MARK: - Device Screen Height
    static var screenHeight : CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    // MARK: - Device Screen Width
    static var screenWidth : CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    // MARK: - Device is Portrait
    static var isPortrait : Bool {
        return UIDevice.isPortrait
    }
    
    // MARK: - Device is Landscape
    static var isLandscape : Bool {
        return UIDevice.isLandscape
    }
    
    // MARK: - Get Device Type
    static var deviceType : DeviceType? {
        // Need to match width also because if device is in portrait mode height will be different.
        if Devices.screenHeight == 568 || Devices.screenWidth == 568 {
            return DeviceType.iPhone5s
        } else if Devices.screenHeight == 667 || Devices.screenWidth == 667{
            return DeviceType.iPhone6or6s
        } else if Devices.screenHeight == 736 || Devices.screenWidth == 736{
            return DeviceType.iPhone6por6sp
        } else if Devices.screenHeight == 812 || Devices.screenWidth == 812{
            return DeviceType.iPhoneX
        }else if Devices.screenHeight == 597.33 || Devices.screenWidth == 597.33{
            return DeviceType.iPhoneXR
        }else if Devices.screenHeight == 896 || Devices.screenWidth == 896{
            return DeviceType.iPhoneXS_MAX
        }else if Devices.screenHeight == 1024 || Devices.screenWidth == 1024{
            return DeviceType.iPadPro_12
        }else if Devices.screenHeight == 834 || Devices.screenWidth == 834{
            return DeviceType.iPadPro_10
        }else if Devices.screenHeight == 768 || Devices.screenWidth == 768{
            return DeviceType.iPad_9
        }
        else{
            return DeviceType.iPad_Mini
        }
    }
    
}

//let IS_iPad_12             = UIScreen.main.bounds.size.height == 1024 ? true : false as Bool
//let IS_iPad_10             = UIScreen.main.bounds.size.height == 834 ? true : false as Bool
//let IS_iPad_9             = UIScreen.main.bounds.size.height == 768 ? true : false as Bool
//let IS_iPad_mini             = UIScreen.main.bounds.size.height == 768 ? true : false as Bool


extension UIDevice {
    
    static var isPortrait : Bool {
        return UIDevice.current.orientation.isPortrait
    }
    
    static var isLandscape : Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
    
}
