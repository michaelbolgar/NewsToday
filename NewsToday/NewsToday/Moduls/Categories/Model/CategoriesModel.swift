import UIKit

struct Category {
    let name: String
    let emoji: String
}

struct Categories {
    static let all = [
        Category(name: "Business", emoji: "💼"),
        Category(name: "Entertainment", emoji: "🎭"),
        Category(name: "General", emoji: "🌐"),
        Category(name: "Health", emoji: "🩺"),
        Category(name: "Science", emoji: "🔬"),
        Category(name: "Sports", emoji: "🏅"),
        Category(name: "Technology", emoji: "💻"),
    ]
}
