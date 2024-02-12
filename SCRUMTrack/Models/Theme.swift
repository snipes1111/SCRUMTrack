//
//  Theme.swift
//  SCRUMTrack
//
//  Created by user on 11/02/2024.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigoLight
    case lavender
    case magentaLight
    case navy
    case orangeLight
    case oxblood
    case periwinkle
    case poppy
    case purpleLight
    case seafoam
    case sky
    case tan
    case tealLight
    case yellowLight
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orangeLight, .periwinkle, .poppy, .seafoam, .sky, .tan, .tealLight, .yellowLight: return .black
        case .indigoLight, .magentaLight, .navy, .oxblood, .purpleLight: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.replacingOccurrences(of: "Light", with: "").capitalized
    }
}
