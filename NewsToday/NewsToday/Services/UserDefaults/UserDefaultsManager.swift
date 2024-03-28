import UIKit

    // MARK: CRUD

protocol UserDefaultsManagerProtocol {

    ///methods for setting new data
    func set(_ object: Any?, forKey key: Keys)

    ///methods for getting saved data
    func getBool(forKey key: Keys) -> Bool?

    ///delete data
    func delete(forKey key: Keys)
}

public enum Keys: String {
    case isLaunchedBefore = "isLaunchedBefore"
    static let favorites = "favorites"
}



final class UserDefaultsManager {

    private let userDefaults = UserDefaults.standard
    

    private func storeData(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }

    private func restoreData(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
   
}


    // MARK: UserDefaultsManagerProtocol

extension UserDefaultsManager: UserDefaultsManagerProtocol {

    func set(_ object: Any?, forKey key: Keys) {
        storeData(object, key: key.rawValue)
    }

    func getBool(forKey key: Keys) -> Bool? {
        restoreData(forKey: key.rawValue) as? Bool
    }

    func delete(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

