//
//  NetworkManagerMock.swift
//
//
//  Created by Sanket Sonje  on 03/06/24.
//

import Foundation
@testable import NetworkingFramework

/// Mock for `NetworkManager` class which provides api's to fetch, delete, update and post data using mock data
/// Use `NetworkServiceMock.shared.get` to use this class in `Testing` environment only.
class NetworkManagerMock: NetworkManagerAPI {

    // MARK: - Properties

    static let shared = NetworkManagerMock()
    private let networkManagerAPIImpl: NetworkManagerAPIImpl

    // MARK: - Init

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkManagerAPIImpl = NetworkManagerAPIImpl(urlSession: urlSession)
    }

    // MARK: - APIs

    func fetchData<T>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        networkManagerAPIImpl.fetchData(from: url, completion: completion)
    }
}
