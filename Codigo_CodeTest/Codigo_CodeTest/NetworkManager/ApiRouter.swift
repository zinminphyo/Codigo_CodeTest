//
//  ApiRouter.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import Alamofire

enum ApiRouter: URLConvertible {
    
    case fetchPopularMovieLists(language: String, page: Int)
    case fetchUpcomingMovieLists(language: String, page: Int)
    case fetchMovieDetails(movieId: Int)
    
    func asURL() throws -> URL {
        return URL(string: url)!
    }
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var url: String {
        return baseURL + "\(path)"
    }
    
    var path: String {
        switch self {
        case .fetchPopularMovieLists:
            return "popular"
        case .fetchUpcomingMovieLists:
            return "upcoming"
        case .fetchMovieDetails(let movieId):
            return "/\(movieId)"
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchPopularMovieLists, .fetchUpcomingMovieLists, .fetchMovieDetails:
            return [
                HTTPHeader(name: "Authorization", value: "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMzIxM2Q5ZDUyOWUyNTBkOTkyOTJjMWYzNmM0NTUyNyIsInN1YiI6IjViNmZlOWMxYzNhMzY4MTg5ZDE2MDE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B23DAT1cmBHF3PwaZKv7lgtkUPRgbG37ej68p1Rat6E"),
                HTTPHeader(name: "accept", value: "application/json")
            ]
        }
        
    }
    
    
    var params: Parameters? {
        switch self {
        case .fetchPopularMovieLists(let language, let page):
            return [
                "language" : language,
                "page" : page
            ]
        case .fetchUpcomingMovieLists(let language, let page):
            return [
                "language" : language,
                "page" : page
            ]
        case .fetchMovieDetails:
            return nil
        }
    }
        
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchPopularMovieLists:
            return .get
        case .fetchUpcomingMovieLists:
            return .get
        case .fetchMovieDetails:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchUpcomingMovieLists, .fetchPopularMovieLists, .fetchMovieDetails:
            return URLEncoding.default
        }
    }
    
}
