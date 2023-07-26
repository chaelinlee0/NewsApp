import SwiftUI

@main
struct NewsApp: App {
    @StateObject var headlineLoader = HeadlineLoader(apiClient: NewsAPIClient())
    @StateObject var searchLoader = SearchLoader(apiClient: NewsAPIClient())
    

  var body: some Scene {
      WindowGroup {
                TabView {
                  HeadlineScreen()
                        .tabItem {
                            Label("Top Headlines", systemImage: "newspaper")
                        }
                        .environmentObject(headlineLoader)
                  Searchscreen()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                        .environmentObject(searchLoader)

                }
              }
  }
}

