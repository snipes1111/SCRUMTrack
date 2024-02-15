//
//  DingAVPlayer.swift
//  SCRUMTrack
//
//  Created by user on 15/02/2024.
//

import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("No sound was found") }
        return AVPlayer(url: url)
    }()
}
