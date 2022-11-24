//
//  Stopwatch_iOSApp.swift
//  Stopwatch iOS
//
//  Created by Yurii Samoienko on 24.11.2022.
//

import SwiftUI

@main
struct Stopwatch_iOSApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
    
}
