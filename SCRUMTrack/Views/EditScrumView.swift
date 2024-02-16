//
//  EditScrumView.swift
//  SCRUMTrack
//
//  Created by user on 16/02/2024.
//

import SwiftUI

struct EditScrumView: View {
    @Binding var isPresentingView: Bool
    @Binding var scrum: DailyScrum
    @Binding var editingScrum: DailyScrum
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    isPresentingView.toggle()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    scrum = editingScrum
                    isPresentingView.toggle()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditScrumView(isPresentingView: .constant(true),
                      scrum: .constant(DailyScrum.sampleData[0]),
                      editingScrum: .constant(DailyScrum.emptyScrum))
    }
}
