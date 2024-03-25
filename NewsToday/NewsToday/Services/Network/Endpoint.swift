import Foundation

// Определение доступных конечных точек API
enum Endpoint {
    case doSearch(request: String)
    case topHeadlines(category: String)
    
    /// Возвращает путь конечной точки в зависимости от выбранного запроса.
    var path: String {
        switch self {
        case .doSearch:
            return "/v2/everything"
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }
}
