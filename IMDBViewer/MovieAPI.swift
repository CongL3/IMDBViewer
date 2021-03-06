//
//  MovieAPI.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import Foundation

class MovieAPI {

    static let shared = MovieAPI()

    private let httpClient = HTTPClient()
    private init() {}

    func fetchMovies(movieType: MovieType,
                     parameters: [String: Any]?,
                     completionHandler: @escaping(Result<MovieListResponse, HTTPErrors>) -> Void) {
        switch movieType {
        case .topRated:
            httpClient.get(url: "https://api.themoviedb.org/3/movie/top_rated",
                           parameters: parameters,
                           completionHandler: completionHandler)
        case .popular:
            httpClient.get(url: "https://api.themoviedb.org/3/movie/popular",
                           parameters: parameters,
                           completionHandler: completionHandler)
        case .upcoming:
            httpClient.get(url: "https://api.themoviedb.org/3/movie/upcoming",
                           parameters: parameters,
                           completionHandler: completionHandler)
        }
    }

//    func fetchMovies(by title: String,
//                     parameters: [String: Any]?,
//                     completionHandler: @escaping(Result<MovieListResponse, HTTPErrors>) -> Void) {
//        httpClient.get(url: "https://api.themoviedb.org/3/search/movie",
//                       parameters: parameters,
//                       completionHandler: completionHandler)
//    }
//
//    func fetchMovieDetails(movieId: Int,
//                           parameters: [String: Any]?,
//                           completionHandler: @escaping(Result<MovieDetailInfo, HTTPErrors>) -> Void) {
//        httpClient.get(url: "https://api.themoviedb.org/3/movie/\(movieId)",
//            parameters: parameters,
//            completionHandler: completionHandler)
//    }
//
    func fetchMovieCastCrew(movieId: Int,
                            parameters: [String: Any]?,
                            completionHandler: @escaping(Result<MovieDetailCastCrewInfo, HTTPErrors>) -> Void) {
        httpClient.get(url: "https://api.themoviedb.org/3/movie/\(movieId)/credits",
            parameters: parameters,
            completionHandler: completionHandler)
    }
//
//    func fetchCastProfileImages(personId: Int,
//                                parameters: [String: Any]?,
//                                completionHandler: @escaping(Result<MovieCastProfileImagesInfo, HTTPErrors>) -> Void) {
//        httpClient.get(url: "https://api.themoviedb.org/3/person/\(personId)/images",
//            parameters: parameters,
//            completionHandler: completionHandler)
//    }
//
    func fetchMovieTrailer(movieId: Int,
                           parameters: [String: Any]?,
                           completionHandler: @escaping(Result<MovieTrailerInfo, HTTPErrors>) -> Void) {
        httpClient.get(url: "https://api.themoviedb.org/3/movie/\(movieId)/videos",
            parameters: parameters,
            completionHandler: completionHandler)
    }
}
