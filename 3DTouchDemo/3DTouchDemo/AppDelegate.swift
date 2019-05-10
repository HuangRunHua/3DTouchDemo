//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /* 添加3D Touch的功能, 在这里先添加了创建新事项的功能 */
        let composeIcon = UIApplicationShortcutIcon(type: .compose)
        let compose = UIApplicationShortcutItem(type: "3DTouch.compose", localizedTitle: "新建博客", localizedSubtitle: nil, icon: composeIcon, userInfo: nil)
        // 使用UIApplicationShortcutIcon(templateImageName: "")语句，你可以添加你自己的图标，在这里我们不用
        //let helpIcon = UIApplicationShortcutIcon(templateImageName: "help")
        //let help = UIApplicationShortcutItem(type: "3DTouch.help", localizedTitle: "帮助", localizedSubtitle: nil, icon: helpIcon, userInfo: nil)
        let alarmIcon = UIApplicationShortcutIcon(type: .alarm)
        let alarm = UIApplicationShortcutItem(type: "3DTouch.alarm", localizedTitle: "设定闹钟", localizedSubtitle: nil, icon: alarmIcon, userInfo: nil)
        
        let cloudIcon = UIApplicationShortcutIcon(type: .cloud)
        let cloud = UIApplicationShortcutItem(type: "3DTouch.cloud", localizedTitle: "查看云端", localizedSubtitle: nil, icon: cloudIcon, userInfo: nil)
        
        let contactIcon = UIApplicationShortcutIcon(type: .contact)
        let contact = UIApplicationShortcutItem(type: "3DTouch.contact", localizedTitle: "个人中心", localizedSubtitle: nil, icon: contactIcon, userInfo: nil)
        
        let shortCutItems = [compose,alarm,cloud,contact]
        application.shortcutItems = shortCutItems
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "3DTouch.compose" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.alarm" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.cloud" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.contact" {
            // 做你觉得对的事
        }
    }

//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }


}

