import Foundation
// public?
enum Endpoint {
    case doSearch(request: String)
    case topHeadlines(category: String)
    
    var path: String {
        switch self {
        case .doSearch:
            return "/v2/everything"
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }
}
