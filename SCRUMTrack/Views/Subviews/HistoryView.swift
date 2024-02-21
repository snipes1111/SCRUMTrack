//
//  HistoryView.swift
//  SCRUMTrack
//
//  Created by user on 21/02/2024.
//

import SwiftUI

struct HistoryView: View {
    
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

#Preview {
    let history = History(attendees: DailyScrum.sampleData[0].attendees,
                          transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    return NavigationStack {
        HistoryView(history: history)
    }
}
