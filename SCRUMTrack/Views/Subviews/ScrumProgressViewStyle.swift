//
//  ScrumProgressViewStyle.swift
//  SCRUMTrack
//
//  Created by user on 14/02/2024.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    
    let theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(theme.accentColor)
                .frame(height: 20)
            if #available(iOS 16, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProgressView(value: 0.4)
        .progressViewStyle(ScrumProgressViewStyle(theme: .bubblegum))
}
