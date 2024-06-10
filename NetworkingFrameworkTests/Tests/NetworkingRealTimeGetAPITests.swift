//
//  NetworkingGetPopularMoviesAPITests.swift
//
//
//  Created by Sanket Sonje  on 04/06/24.
//

import Foundation
import XCTest

@testable import NetworkingFramework

class NetworkingRealTimeGetAPITests: XCTestCase {

    // MARK: - Properties

    private static let trendingMoviesURL: URL? =
        URL(string: NetworkingAPIConstants.baseURL.rawValue
            + NetworkingAPIConstants.trendingMovies.rawValue
            + NetworkingAPIConstants.apiKey.rawValue)

    private static let popularMoviesURL: URL? =
    URL(string: NetworkingAPIConstants.baseURL.rawValue
        + NetworkingAPIConstants.popularMovies.rawValue
        + NetworkingAPIConstants.apiKey.rawValue)

    // MARK: - Tests

    func testNetworkFetchTrendingMovies() throws {
        let expectation = XCTestExpectation(description: "Fetch trending movies data from real time server expectation.")
        let trendingMoviesURL = try XCTUnwrap(Self.trendingMoviesURL)
        NetworkManager.shared.fetchData(from: trendingMoviesURL, completion: { (result: Result<TrendingMovies, Error>) in
            switch result {
            case .success(let movies):
                XCTAssertNotNil(movies)
                expectation.fulfill()
                break
            case .failure(_):
                XCTAssertTrue(false)
            }
        })

        wait(for: [expectation], timeout: 5.0)
    }

    func testNetworkFetchPopularMovies() throws {
        let expectation = XCTestExpectation(description: "Fetch popular movies data from real time server expectation.")
        let popularMoviesURL = try XCTUnwrap(Self.popularMoviesURL)
        NetworkManager.shared.fetchData(from: popularMoviesURL, completion: { (result: Result<TrendingMovies, Error>) in
            switch result {
            case .success(let movies):
                XCTAssertNotNil(movies)
                expectation.fulfill()
                break
            case .failure(_):
                XCTAssertTrue(false)
            }
        })

        wait(for: [expectation], timeout: 5.0)
    }
}
