//
//  ScrumsView.swift
//  SCRUMTrack
//
//  Created by user on 11/02/2024.
//

import SwiftUI

struct ScrumsView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var isPresentingNewScrumView: Bool = false
    @Binding var scrums: [DailyScrum]
    
    var saveAction: () -> ()
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingSheet: $isPresentingNewScrumView)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: { isPresentingNewScrumView.toggle() }) {
                    Image(systemName: "plus")
                }
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .inactive { saveAction() }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData),
               saveAction: {})
}
