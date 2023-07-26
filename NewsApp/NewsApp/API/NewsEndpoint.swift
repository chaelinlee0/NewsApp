import Foundation
import CoreLocation

struct NewsEndpoint {
  static let baseUrl = "https://newsapi.org/v2/"
  static let apiKey = "daa52f2c12134f28a0b0aec1397835ff"
    enum QueryType {
        case search(userInput: String)
        case headlines

        var queryName: String {
          switch self {
          case .search: return "everything"
          case .headlines: return "top-headlines"
          }
        }
      }

    static func path(queryType: QueryType) -> String {
        let url = "\(baseUrl)/\(queryType.queryName)"
        let key = "apiKey=\(apiKey)"

        var queryParameters:String
        switch queryType {
        case .search(let userInput): queryParameters = "q=\(userInput)"
        case .headlines: queryParameters = "country=us"
        }
        dump("\(url)?\(queryParameters)&\(key)")
        return "\(url)?\(queryParameters)&\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Error"
      }
}


