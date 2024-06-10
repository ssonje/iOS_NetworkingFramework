//
//  NetworkService.swift
//
//
//  Created by Sanket Sonje  on 31/05/24.
//

import Foundation

/// Provides network layer access to use and fetch movies data
/// NOTE: This is an shared class singleton, so init won't be available.
/// Example:
/// * Fetch movies data
/// ```
/// NetworkManager.shared.fetchData(url:completion:)
/// ```
public class NetworkManager: NetworkManagerAPI {

    // MARK: - Properties

    public static let shared: NetworkManager = NetworkManager()
    private let networkManagerAPIImpl: NetworkManagerAPIImpl

    // MARK: - Init

    private init() {
        networkManagerAPIImpl = NetworkManagerAPIImpl(urlSession: NetworkingSession.session)
    }

    // MARK: - API's

    public func fetchData<T>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        networkManagerAPIImpl.fetchData(from: url, completion: completion)
    }
}
