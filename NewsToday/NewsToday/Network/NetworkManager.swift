import Foundation

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
        parameters["language"] = "en"
        
        
        switch endpoint {
        case .doSearch(request: let request):
            parameters["q"] = request
        case .topHeadlines(category: let category):
            parameters["category"] = category
        }
        return parameters
        
    }
    
    private func makeRequest<T: Codable>(
        for url: URL,
        apiKey: String,
        using session: URLSession = .shared,
        completion: @escaping(Result<T, NetworkErrors>) -> Void
    ) {

        let request = URLRequest(url: url)
        print("URL: \(url.absoluteString)")
       
        session.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unexpectedError))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                
                let defaultErrorMessage = "An error occurred"
                
                if let data = data,
                   let apiError = try? JSONDecoder().decode(ApiError.self, from: data),
                    let message = apiError.message {
                    
                    completion(
                        .failure(
                            .apiError(
                                statusCode: httpResponse.statusCode,
                                message: message
                            )
                        )
                    )
                } else {
                    completion(
                        .failure(
                        .serverError(
                            statusCode: httpResponse.statusCode,
                            message: defaultErrorMessage)
                        )
                    )
                }
                return
            }

            let statusCode = httpResponse.statusCode
        
            guard let data = data else {
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
    
    func doSearch(
        for request: String,
        completion: @escaping(Result<SearchResults, NetworkErrors>) -> Void
    ) {
        guard let url = createURL(for: .doSearch(request: request)) else { return }
        
        makeRequest(for: url, apiKey: API.apiKey, completion: completion)
    }
    
    func fetchTopHeadlines(
        category: String,
        completion: @escaping(Result<SearchResults, NetworkErrors>) -> Void
    ) {
        guard let url = createURL(for: .topHeadlines(category: category)) else { return }
        
        makeRequest(for: url, apiKey: API.apiKey, completion: completion)
    }
}
