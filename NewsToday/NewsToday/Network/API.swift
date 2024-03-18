import Foundation

struct API {
    static let scheme = "https"
    static let host = "newsapi.org/v2/"
    static let apiKey = Token.first
}

struct Token {
    // сюда надо будет добавлять ключи по мере надобности, если буду заканчиваться запросы
    static let first = "55c555f55ce34b2aa8090f1e25017ddd"
    static let second = "195a5aebba54417e8a7f91ed37e90ac9"
}

