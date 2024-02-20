//
//  MeetingTimerView.swift
//  SCRUMTrack
//
//  Created by user on 20/02/2024.
//

import SwiftUI

struct MeetingTimerView: View {
    
    let theme: Theme
    let speakers: [ScrumTimer.Speaker]
    
    private var speaker: String {
        speakers.first { !$0.isCompleted }?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(speaker)
                        .font(.title)
                    Text("is speaking")
                }
                .foregroundStyle(theme.accentColor)
                .accessibilityElement(children: .combine)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted,
                       let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .stroke(theme.mainColor, lineWidth: 12)
                            .rotationEffect(Angle(degrees: -90))
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true),
         ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
        
    return MeetingTimerView(theme: .bubblegum,
                     speakers: speakers)
}
