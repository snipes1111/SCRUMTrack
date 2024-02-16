//
//  DetailView.swift
//  SCRUMTrack
//
//  Created by user on 12/02/2024.
//

import SwiftUI

struct DetailView: View {
    
    @State private var editingScrum: DailyScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView: Bool = false
    @Binding var scrum: DailyScrum
    
    var body: some View {
        List {
            Section("Meeting Info") {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(.blue)
                }
                HStack {
                    Label("Lenght", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
            }
            Section("Attendees") {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section("History") {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                } else {
                    ForEach(scrum.history) { history in
                        HStack {
                            Image(systemName: "calendar.badge.exclamationmark")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                EditScrumView(isPresentingView: $isPresentingEditView,
                              scrum: $scrum, editingScrum: $editingScrum)
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView.toggle()
                editingScrum = scrum
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
