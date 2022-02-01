//
//  LocalNotificationManager.swift
//  Infoeduka (iOS)
//
//  Created by doss on 1/30/22.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
    static let shared = LocalNotificationManager()
    
    var notifications = [Notification]()
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    func sendNotification(title: String, substitle: String?, body: String, launchIn: Double) {
        let content = UNMutableNotificationContent()
        content.title = title
        if let substitle = substitle {
            content.subtitle = substitle
        }
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        let request = UNNotificationRequest(identifier: "hr.algbra.infoeduka.vijestinotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
