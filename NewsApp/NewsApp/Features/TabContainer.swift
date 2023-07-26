import SwiftUI

struct TabContainer: View {
    let articles: [Article]
    var body: some View {
      TabView {
          HeadlineScreen()
          .tabItem {
              Label("Top Headlines", systemImage: "newspaper")
          }
          Searchscreen()
          .tabItem {
              Label("Search", systemImage: "magnifyingglass")
          }
          

      }
    }
}

struct TabContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabContainer(articles: Article.mockSearch())
        
    }
}
