import SwiftUI

struct Searchscreen: View {
    @EnvironmentObject var searchLoader: SearchLoader
    @State var searchText = ""
    
    var body: some View{
            VStack {
                TextField("Search", text: $searchText)
            Button("Get Articles"){
                Task{await searchLoader.loadSearch(search: searchText)}
            }.buttonStyle(.borderedProminent)
            switch searchLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed(let error): Text("Error \(error.localizedDescription)")
            case .success(let response):
                DisplaySearch(articles: response.articles)
            }
        }
    }
}

struct DisplaySearch: View {
    @EnvironmentObject var searchLoader: SearchLoader
    let articles: [Article]
    
    var body: some View{
        List(articles) {
            article in
            VStack{
                if let imageURL = article.urlToImage{
                    AsyncImage(url: URL(string: imageURL), content:{ image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: { EmptyView()})
                }
                Text(article.title ?? "No Title")
                    .font(.headline)
            }
        }
    }
}


struct SearchList_Previews: PreviewProvider {
  static var previews: some View {
      Searchscreen()
          .environmentObject(SearchLoader(apiClient: NewsAPIClient()))
  }
}
