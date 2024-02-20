//
//  ErrorView.swift
//  SCRUMTrack
//
//  Created by user on 19/02/2024.
//

import SwiftUI
import PDFKit

struct ErrorView: View {
    
    @Environment (\.dismiss) private var dissmiss
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occured")
                    .padding()
                    .font(.title)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .padding()
                    .font(.caption)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dissmiss") {
                        dissmiss()
                    }
                }
            }
        }
    }
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }
    var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error")
    }
    return ErrorView(errorWrapper: wrapper)
}
