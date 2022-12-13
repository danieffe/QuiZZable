//
//  AvatarChoiceApp.swift
//  AvatarChoice
//
//  Created by Michele Valentino on 09/12/22.
//

import SwiftUI

@main
struct AvatarChoiceApp: App {
    @StateObject private var dataController =  DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
