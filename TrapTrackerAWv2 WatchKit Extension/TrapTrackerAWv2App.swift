//
//  TrapTrackerAWv2App.swift
//  TrapTrackerAWv2 WatchKit Extension
//
//  Created by Doxie Davis on 5/12/22.
//

import SwiftUI

@main
struct TrapTrackerAWApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                DayView(dataModel: DataModel())
            }
        }
    }
}

//        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
//    }
//
