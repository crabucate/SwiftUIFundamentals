//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Felix Leitenberger on 09.12.20.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
