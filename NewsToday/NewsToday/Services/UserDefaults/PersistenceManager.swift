//
//  PersistenceManager.swift
//  NewsToday
//
//  Created by Maryna Bolotska on 28/03/24.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}
enum PersistenceError: Error {
    case alreadyInFavorites
}


enum PersistenceManager {
  static private let defaults = UserDefaults.standard

    static func updateWith(favorite: Article, actionType: PersistenceActionType, completed: @escaping (Error?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    if favorites.contains(where: { $0.title == favorite.title }) {
                        completed(PersistenceError.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.title == favorite.title }
                }
                completed(save(favorites: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }

    static func retrieveFavorites(completed: @escaping (Result<[Article], Error>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            // if no data found, then need to init w/ empty array
            completed(.success([]))
            return
        }
        
        // need do/try catch for custom object
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Article].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(error))
        }
    }
    
    static func save(favorites: [Article]) -> Error? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return error
        }
    }
}
