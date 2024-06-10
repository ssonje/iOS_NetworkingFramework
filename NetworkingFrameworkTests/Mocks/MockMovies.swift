//
//  MoviesMock.swift
//
//
//  Created by Sanket Sonje  on 02/06/24.
//

import Foundation

@testable import NetworkingFramework

// MARK: - MoviesMock

/// Mock class which provides mock data for trending and popular movies
public class MoviesMock {

    static var mockMovies: [Movie]? {
        let resourceURL = Bundle(for: NetworkingFrameworkTests.self).url(forResource: "movie_list", withExtension: "json")
        let jsonDecoder = JSONDecoder()
        guard let resourceURL,
              let data = try? Data(contentsOf: resourceURL),
              let jsonData = try? jsonDecoder.decode(TrendingMovies.self, from: data) else {
            return nil
        }

        return jsonData.results
    }

    static var mockMovie: Movie? {
        mockMovies![0]
    }

    static var mockTrendingMoviesData: Data? {
        let resourceURL = Bundle(for: NetworkingFrameworkTests.self).url(forResource: "trending_movie", withExtension: "json")
        guard let resourceURL,
              let data = try? Data(contentsOf: resourceURL) else {
            return nil
        }

        return data
    }

    static var mockPopularMoviesData: Data? {
        let resourceURL = Bundle(for: NetworkingFrameworkTests.self).url(forResource: "popular_movie", withExtension: "json")
        guard let resourceURL,
              let data = try? Data(contentsOf: resourceURL) else {
            return nil
        }

        return data
    }

    static var mockMovieInfoData: Movie? {
        let resourceURL = Bundle(for: NetworkingFrameworkTests.self).url(forResource: "movie_info", withExtension: "json")
        let jsonDecoder = JSONDecoder()
        guard let resourceURL,
              let data = try? Data(contentsOf: resourceURL),
              let jsonData = try? jsonDecoder.decode(Movie.self, from: data) else {
            return nil
        }

        return jsonData
    }
}

// MARK: - Extension Bundle

extension Bundle {

    func loadAndDecodeJSON<T: Decodable>(filename: String) throws -> T? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        let jsonData = try jsonDecoder.decode(T.self, from: data)
        return jsonData
    }

    func loadData(from file: String) throws -> Data? {
        guard let url = self.url(forResource: file, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        return data
    }
}
