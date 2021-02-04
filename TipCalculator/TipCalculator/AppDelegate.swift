//
//  AppDelegate.swift
//  TipCalculatorStarter
//
//  Created by Memo on 10/11/18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - App Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Check to see if 10 minutes have passed since last input
        let recentBill = Bill.UD.double(forKey: Bill.lastBillInput)
        let activeAgoDouble = Bill.UD.double(forKey: Bill.lastInputTime)
        let activeAgoDate = Date(timeIntervalSince1970: activeAgoDouble)
        let interval = Date().timeIntervalSince(activeAgoDate)
        
        print("Last input:", recentBill)
        print(Int(interval), "seconds since last input")
        
        // Reset bill after 600 seconds since last input
        if interval > 600 {
            Bill.UD.set(0.0, forKey: Bill.lastBillInput)
        } else {
            let viewController = self.window?.rootViewController as! ViewController
            viewController.calculate()
        }
        
    }
    
}

