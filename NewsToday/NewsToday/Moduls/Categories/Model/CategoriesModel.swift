import UIKit

struct Category {
    let name: String
    let emoji: String
    let id: Int
}

struct Categories {
    static let all = [
        Category(name: "Sports", emoji: "🏈", id: 0),
        Category(name: "Life", emoji: "🌞", id: 1),
        Category(name: "Animals", emoji: "🐻", id: 2),
        Category(name: "Food", emoji: "🍔", id: 3),
        Category(name: "History", emoji: "📜", id: 4),
        Category(name: "Middle East", emoji: "⚔️", id: 5),
        Category(name: "Politics", emoji: "⚖️", id: 6),
        Category(name: "Fashion", emoji: "👗", id: 7),
        Category(name: "Gaming", emoji: "🎮", id: 8),
        Category(name: "Technology", emoji: "💻", id: 9),
        Category(name: "Art", emoji: "🎨", id: 10),
        Category(name: "Travel", emoji: "✈️", id: 11)
        
    ]
}
