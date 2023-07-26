import CoreLocation
protocol NewsAPI {
  func fetchSearch(userInput: String) async throws -> NewsResponse
    func fetchHeadlines() async throws -> NewsResponse
}

struct NewsAPIClient: NewsAPI, APIClient {
  let session: URLSession = .shared


  func fetchSearch(userInput: String) async throws -> NewsResponse {
      let path = NewsEndpoint.path(queryType: .search(userInput: userInput))
      let response: NewsResponse = try await performRequest(url: path)
//      dump(path)
    return response
  }
    
    func fetchHeadlines() async throws -> NewsResponse {
        let path = NewsEndpoint.path(queryType: .headlines)
        let response: NewsResponse = try await performRequest(url: path)
      return response
    }
}
