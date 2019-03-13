//
//  ViewController.swift
//  SnoozeLN
//
//  Created by Govind on 14/02/19.
//  Copyright © 2019 Govind. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate{

    
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
            }
        }
        
        
    }
    
    
    
    
    @IBAction func setnotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.body = "Buy some milk"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3,repeats: false)
        
        // Swift
        let identifier = "UYLLocalNotification"
        
        
        
//        let snoozeAction = UNNotificationAction(identifier: "Snooze",
//                                                title: "Snooze", options: [])
//        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
//                                                title: "Delete", options: [.destructive])
//        
//        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
//                                              actions: [snoozeAction,deleteAction],
//                                              intentIdentifiers: [], options: [])
//        
//        center.setNotificationCategories([category])
        
        content.categoryIdentifier = "UYLReminderCategory"
        
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        
        
        center.add(request) { (error) in
            //UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                print(error ?? "Error..")}
        }
    }
    

}

