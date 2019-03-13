//
//  File.swift
//  SnoozeLN
//
//  Created by Govind on 14/02/19.
//  Copyright © 2019 Govind. All rights reserved.
//
import Foundation
import UserNotifications

class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        case "Snooze":
            print("Snooze")
            let content = UNMutableNotificationContent()
            content.title = "terminated app"
            content.body = "snooze wala"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2,repeats: false)
            
            // Swift
            let identifier = "UYLLocalNotification"
            
//            let snoozeAction = UNNotificationAction(identifier: "Snooze",
//                                                    title: "Snooze", options: [])
//            let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
//                                                    title: "Delete", options: [.destructive])
//            
//            let category = UNNotificationCategory(identifier: "UYLReminderCategory",
//                                                  actions: [snoozeAction,deleteAction],
//                                                  intentIdentifiers: [], options: [])
//            
//            center.setNotificationCategories([category])
            
            content.categoryIdentifier = "UYLReminderCategory"
            
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            
            
            center.add(request) { (error) in
                //UNUserNotificationCenter.current().delegate = self
                if (error != nil){
                    print(error ?? "Error..")}
            }
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
