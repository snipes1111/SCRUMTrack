//
//  ScrumStore.swift
//  SCRUMTrack
//
//  Created by user on 16/02/2024.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, 
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
            .appending(path: "scrums.data")
    }
    
    func load() async throws {
        let task: Task <[DailyScrum], Error> = Task {
            let fileUrl = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileUrl)
            else { return [] }
            let savedScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return savedScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save() async throws {
        let task = Task {
            let jsonData = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try jsonData.write(to: outfile, options: .atomic)
        }
        try await task.value
    }
}
