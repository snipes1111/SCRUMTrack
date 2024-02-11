//
//  SCRUMTrackApp.swift
//  SCRUMTrack
//
//  Created by user on 09/02/2024.
//

import SwiftUI

@main
struct SCRUMTrackApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
