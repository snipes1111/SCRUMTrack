//
//  ScrumsView.swift
//  SCRUMTrack
//
//  Created by user on 11/02/2024.
//

import SwiftUI

struct ScrumsView: View {
    @State var isPresentingNewScrumView: Bool = false
    @Binding var scrums: [DailyScrum]
    
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
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
