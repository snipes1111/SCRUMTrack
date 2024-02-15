//
//  ContentView.swift
//  SCRUMTrack
//
//  Created by user on 09/02/2024.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @StateObject var scrumTimer: ScrumTimer = ScrumTimer()
    @Binding var scrum: DailyScrum
    
    var player: AVPlayer = AVPlayer.sharedDingPlayer
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum()
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
