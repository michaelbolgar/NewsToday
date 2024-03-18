import Foundation
// public?
enum Endpoint {
    case doSearch(request: String)
    
    var path: String {
        switch self {
        case .doSearch(request: <#T##String#>)
        }
    }
}
