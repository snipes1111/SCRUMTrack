//
//  SCRUMTrackApp.swift
//  SCRUMTrack
//
//  Created by user on 09/02/2024.
//

import SwiftUI

@main
struct SCRUMTrackApp: App {
    
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
