//
//  MeetingFooterView.swift
//  SCRUMTrack
//
//  Created by user on 15/02/2024.
//

import SwiftUI

struct MeetingFooterView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let skipAction: () -> ()
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else {  return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerInfo: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerInfo)
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
}
