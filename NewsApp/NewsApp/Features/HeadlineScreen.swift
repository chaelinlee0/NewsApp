import SwiftUI

struct HeadlineScreen: View {
  @EnvironmentObject var headlineLoader: HeadlineLoader

  var body: some View {
    VStack {
      switch headlineLoader.state {
      case .idle: Color.clear
      case .loading: ProgressView()
      case .failed(let error): Text("Error \(error.localizedDescription)")
      case .success(let response):
          DisplaySearch(articles: response.articles)
      }
    }
    .task { await headlineLoader.loadHeadlines() }
  }
}

struct HeadlineScreen_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineScreen()
            .environmentObject(HeadlineLoader(apiClient: NewsAPIClient()))
    }
}
