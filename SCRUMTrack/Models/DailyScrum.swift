//
//  DailyScrum.swift
//  SCRUMTrack
//
//  Created by user on 11/02/2024.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        } set {
            lengthInMinutes = Int(newValue)
        }
    }
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
            self.id = id
            self.title = title
            self.attendees = attendees.map { Attendee(name: $0) }
            self.lengthInMinutes = lengthInMinutes
            self.theme = theme
        }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellowLight),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orangeLight),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
    
    static let emptyScrum: DailyScrum = DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
}
