//
//  NewScrumSheet.swift
//  SCRUMTrack
//
//  Created by user on 15/02/2024.
//

import SwiftUI

struct NewScrumSheet: View {
    
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingSheet: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingSheet.toggle()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dissmiss") {
                            isPresentingSheet.toggle()
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData),
                  isPresentingSheet: .constant(true))
}
