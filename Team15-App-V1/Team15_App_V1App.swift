//
//  Team15_App_V1App.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI
import FirebaseCore
import BackgroundTasks

@main
struct Team15_App_V1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var phase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
      
    }
}


// tried to do background but don't think it works

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          FirebaseApp.configure()
          print("Finished launching")
          return true
  }

}

