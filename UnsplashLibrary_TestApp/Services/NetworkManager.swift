//
//  NetworkManager.swift
//  UnsplashLibrary_TestApp
//
//  Created by Nechaev Sergey  on 18.03.2022.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> Void) {
        request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error \(error)")
                completion(nil)
            }

            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }

    private func decodeJSON<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }

        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let errorJ {
            print("Error Decoding JSON", errorJ)
            return nil
        }
    }

    private func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = prepareParameters(searchTerm: searchTerm)
        let url = createUrl(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "GET"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID wSwG8bG-gs9HwkNqnDSX8A2LsdhcoQ-pC3SMSUbJ7us"
        return headers
    }

    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = "1"
        parameters["per_page"] = "30"
        return parameters
    }

    private func createUrl(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
