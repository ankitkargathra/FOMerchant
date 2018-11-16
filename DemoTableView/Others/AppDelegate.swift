//
//  AppDelegate.swift
//  DemoTableView
//
//  Created by Rajat Lala on 11/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SJSwiftSideMenuController


let isLive : Bool! = false
var kCurrentUser : UserRootClass!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? //= WallpaperWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        sleep(2)
        IQKeyboardManager.shared.enable = true
        checkUserStatus()
        // Override point for customization after application launch.
        return true
    }
    
    
    func checkUserStatus(){
        if UserDefaults.standard.object(forKey: "userData") != nil{
            kCurrentUser = UserRootClass.shared
            kCurrentUser.parseDict(fromDictionary: UserDefaults.standard.object(forKey: "userData") as! [String : Any])
            if UserRootClass.shared.isConfirm == "1"{
                setUpLoggedInUser()
            }else{
                SetUpNavigateToIntroScreen()
            }
        }else{
            SetUpNavigateToIntroScreen()
        }
    }
    
    func SetUpNavigateToIntroScreen(){
        if Devices.isIpad{
//                        let vc = EPConstant.Storyboard.AuthenticationStoryboard_ipad.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kiPadLoginViewController) as! iPadLoginViewController
//                        let navVC = UINavigationController(rootViewController: vc)
//                        navVC.isNavigationBarHidden = true
//                        self.window?.rootViewController = navVC            
        }else{
            let vc = EPConstant.Storyboard.AuthenticationStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kIntroViewController) as! ViewController
            let navVC = UINavigationController(rootViewController: vc)
            navVC.isNavigationBarHidden = true
            self.window?.rootViewController = navVC
        }
    }
    
    func setUpLoggedInUser(){
        if Devices.isIpad{
        }else{
            let mainVC = SJSwiftSideMenuController()
            let sideVC : SideMenuViewController = (EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kSideMenuController) as? SideMenuViewController)!
            let rootVC = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kMainViewController) as! MainViewController
            SJSwiftSideMenuController.setUpNavigation(rootController: rootVC, leftMenuController: sideVC, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideOver)
            SJSwiftSideMenuController.enableDimbackground = true
            SJSwiftSideMenuController.leftMenuWidth = UIScreen.main.bounds.size.width*0.80
            AppDel.window?.rootViewController = mainVC
            AppDel.window?.makeKeyAndVisible()
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

