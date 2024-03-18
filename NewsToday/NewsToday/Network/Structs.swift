import Foundation

struct SearchResults: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Articles]
}

struct Articles: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
    
}

struct Source: Codable {
    let id: String?
    let name: String?
}

