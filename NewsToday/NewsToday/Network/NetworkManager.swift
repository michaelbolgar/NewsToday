import Foundation

enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
}

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Private methods
    
    private func createURL(
        for endPoint: Endpoint,
        with query: String? = nil
    ) -> URL? {

        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = endPoint.path

        components.queryItems = makeParameters(for: endPoint, with: query).compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return components.url
    }
   
    private func makeParameters(for endpoint: Endpoint, with query: String?) -> [String:String] {
        
        var parameters = [String:String]()
        
        parameters["apiKey"] = API.apiKey
        
        switch endpoint {
        case .doSearch(request: let request):
            parameters["q"] = request
        case .topHeadlines(category: let category):
            parameters["category"] = category
        }
        return parameters
    }
    
    private func makeRequest<T: Codable>(for url: URL, apiKey: String, using session: URLSession = .shared, completion: @escaping(Result<T, NetworkError>) -> Void) {

        let request = URLRequest(url: url)
        print("URL: \(url.absoluteString)")
       
        session.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "No HTTPURLResponse", code: 0, userInfo: nil)
                completion(.failure(.serverError(statusCode: error.code)))
                return
            }

            let statusCode = httpResponse.statusCode

            
            if statusCode == 401 {
                let unauthorizedError = NSError(domain: "Unauthorized", code: 401, userInfo: nil)
                completion(.failure(.serverError(statusCode: statusCode)))
                print ("Error \(statusCode). Unauthorized")
                return
            }

            
            if statusCode == 403 {
                let exceededLimitError = NSError(domain: "Forbidden", code: 403, userInfo: nil)
                completion(.failure(.serverError(statusCode: statusCode)))
                print ("Error \(statusCode). Daily request limit exceeded")
                return
            }

            guard let data = data else {
                let error =  NSError(domain: "No data", code: 0, userInfo: nil)
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                completion(.success(decodeData))
                
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    func doSearch(for request: String, completion: @escaping(Result<SearchResults, NetworkError>) -> Void) {
        guard let url = createURL(for: .doSearch(request: request)) else { return }
        makeRequest(for: url, apiKey: API.apiKey, completion: completion)
    }
    
    func fetchTopHeadlines(category: String, completion: @escaping(Result<SearchResults, NetworkError>) -> Void) {
        guard let url = createURL(for: .topHeadlines(category: category)) else { return }
        makeRequest(for: url, apiKey: API.apiKey, completion: completion)
    }
}
