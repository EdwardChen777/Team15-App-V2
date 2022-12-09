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
//        .onChange(of: phase) {
//          newPhase in
//          switch newPhase{
//            case.background: scheduleAppRefresh()
//            default: break
//          }
//        }
//        .backgroundTask(.appRefresh("myapprefresh")) {
//          await handleFileDownd()
//        }
//        .backgroundTask(.urlSession("myurlsession")) {
//
//        }
//        handleAppRefresh(task: ApiFetch() as! <#T##BGAppRefreshTask#>)
      
    }
}


// tried to do background but don't think it works

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          FirebaseApp.configure()
          print("Finished launching")
//          registerBackgroundTasks()
          return true
  }
//  func applicationDidEnterBackground(_ application: UIApplication){
//    scheduleAppRefresh()
//  }
}

//private func registerBackgroundTasks() {
//  BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.Team15-App-V1.refresh", using: nil) { task in
////       scheduleLocalNotification()
//       handleAppRefresh(task: task as! BGAppRefreshTask)
//  }
//}
//
//
//func scheduleAppRefresh() {
//   let request = BGAppRefreshTaskRequest(identifier: "com.Team15-App-V1.refresh")
//   // Fetch no earlier than an hour from now.
//   request.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 60)
//
//   do {
//      try BGTaskScheduler.shared.submit(request)
//   } catch {
//      print("Could not schedule app refresh: \(error)")
//   }
//}
//
//func handleAppRefresh(task: BGAppRefreshTask) {
//   // Schedule a new refresh task.
//   scheduleAppRefresh()
//
//   // Create an operation that performs the main part of the background task.
//   let operation = ApiFetch()
// }
