//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) {
            (didAllow, Error) in
            
            print(didAllow)
        }
    }
    
    @IBAction func buttonAction() {
        let content = UNMutableNotificationContent()
        content.title = "This is title"
        content.subtitle = "This is subtitle"
        content.body = "This is body. looloolalaa~"
        content.badge = 0
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myRequestId", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
