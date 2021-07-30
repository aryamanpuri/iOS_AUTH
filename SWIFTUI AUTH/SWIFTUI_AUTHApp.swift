//
//  SWIFTUI_AUTHApp.swift
//  SWIFTUI AUTH
//
//  Created by Aryaman Puri on 28/07/21.
//

import SwiftUI
import Firebase

 

@main
struct SWIFTUI_AUTHApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application : UIApplication , didFinishLaunchingWithOptions launchOptions :
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
