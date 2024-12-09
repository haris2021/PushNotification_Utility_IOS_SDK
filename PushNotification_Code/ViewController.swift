//
//  ViewController.swift
//  PushNotification_Code
//
//  Created by Haris Gunasekaran on 12/8/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let mainscreen = MainScreen()

    override func loadView() {
        view = mainscreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request Notification Authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permission granted.")
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        // Set the delegate for the UNUserNotificationCenter
        UNUserNotificationCenter.current().delegate = self
        
        // Add target for button action
        mainscreen.button.addTarget(self, action: #selector(buttontapped), for: .touchUpInside)
    }
    
    @objc func buttontapped() {
        print("Button tapped")
        scheduleNotification()
    }
    
    func scheduleNotification() {
        // Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "New Job Alert!"
        content.body = "A new part-time job is available near you. Check it out now!"
        content.sound = .default
        
        // Create a trigger that immediately fires the notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // Create a notification request with the content and trigger
        let request = UNNotificationRequest(identifier: "jobAlert", content: content, trigger: trigger)
        
        // Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification added successfully!")
            }
        }
    }
    
    // Handle notifications when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
          print("Notification received in foreground")
          completionHandler([.alert, .sound, .badge]) // Display notification even if the app is in the foreground
      }
  }
