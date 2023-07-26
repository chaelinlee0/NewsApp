import Foundation

class HeadlineLoader: ObservableObject {
  let apiClient: NewsAPIClient
  @Published private(set) var state: LoadingState = .idle

  enum LoadingState {
    case idle
    case loading
    case success(data: NewsResponse)
    case failed(error: Error)
  }

  init(apiClient: NewsAPIClient) {
    self.apiClient = apiClient
  }

  @MainActor
  func loadHeadlines() async {
    self.state = .loading
    do {
        let newsResponse = try await apiClient.fetchHeadlines()
        self.state = .success(data: newsResponse)
      } catch {
        self.state = .failed(error: error)
      }
  }
}
