//
//  TestApiKeysManager.swift
//  SCRUMTrack
//
//  Created by user on 19/02/2024.
//

import Foundation

struct TestApiKeysManager {
    static func testApiKey() -> String {
        guard let url = Bundle.main.url(forResource: "TestKeys", withExtension: "plist"),
              let dict = try? NSDictionary(contentsOf: url, error: ())
        else { return "No url" }
        return dict["API_KEY"] as? String ?? "No url"
    }
    
    static func testApiKeyFromInfoPlist() -> String {
        let value = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        return value ?? "No key"
    }
}
