//
//  SCRUMTrackApp.swift
//  SCRUMTrack
//
//  Created by user on 09/02/2024.
//

import SwiftUI

@main
struct SCRUMTrackApp: App {
    
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later")
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later")
                    }
                }
                .sheet(item: $errorWrapper) {
                    store.scrums = DailyScrum.sampleData
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
}
