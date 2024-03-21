import Foundation

enum NetworkErrors: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case serverError(statusCode: Int, message: String?)
    case unexpectedError
    case apiError(ApiError)
}

struct ApiError: Codable {
    let status: String
    let code: String?
    let message: String?
}
