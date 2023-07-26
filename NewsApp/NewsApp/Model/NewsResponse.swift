
struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
}

struct Article: Decodable, Identifiable {
    var id: String {url}
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    

    static func mockSearch() -> [Article] {
        [Article(source: Source(id: "nytimes", name: "New York Times"), author: nil, title: "Professor makes fool of himself in front of the class", description: "Lurid details to follow", url: "https://nytimes.com", urlToImage: "https://nytimes.com", publishedAt: "2023-02-23T12:05:35", content: "A big long article that will go viral")]
    }
}

struct Source: Decodable {
    let id: String?
    let name: String?
}



