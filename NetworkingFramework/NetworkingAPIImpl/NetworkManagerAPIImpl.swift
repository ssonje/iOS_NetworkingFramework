//
//  NetworkManagerAPIImpl.swift
//  
//
//  Created by Sanket Sonje  on 31/05/24.
//

import Foundation

/// Implementation class which provides actual network request hit for fetching trending and popular movies using URLSession
class NetworkManagerAPIImpl: NetworkManagerAPI {

    // MARK: - Properties

    private let urlSession: URLSession

    // MARK: - Init

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    // MARK: - Fetch Data

    func fetchData<T>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        // Create URL Session to fetch data
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            if let error {
                print("[NetworkingGetRequestAPIImpl] Unfortunately, get request failed with error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard response is HTTPURLResponse else {
                print("[NetworkingGetRequestAPIImpl] Get nil response from the server. Hence, Unable to parse the response as HTTPURLResponse")
                return
            }

            guard let data else {
                print("[NetworkingGetRequestAPIImpl] Get nil data from the server.")
                return
            }

            do {
                // Parse the data
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    print("[NetworkingGetRequestAPIImpl] Data fetched successfully.")
                }
            } catch {
                print("[NetworkingGetRequestAPIImpl] Failed to decode the data.")
                completion(.failure(error))
                return
            }
        }

        dataTask.resume()
    }
}
