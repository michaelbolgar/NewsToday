//
//  UserDefaults.swift
//  NewsToday
//
//  Created by Семен Шевчик on 24.03.2024.
//

import UIKit

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let hasLaunchedKey = "hasLaunched"
    
    var hasLaunchedBefore: Bool {
        get {
            return UserDefaults.standard.bool(forKey: hasLaunchedKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hasLaunchedKey)
        }
    }
    private init() {}
}
