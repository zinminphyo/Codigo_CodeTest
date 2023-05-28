//
//  MovieDetialsViewModel.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import Combine

struct MovieDetailsModel: Decodable {
    let adult: Bool
    let backdropPath: String
    var backdropFullPath: String {
        return "https://image.tmdb.org/t/p/original/" + backdropPath
    }
    let collection: String?
    let budget: Int
    let homepage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    var posterFullPath: String {
        return "https://image.tmdb.org/t/p/original/" + posterPath
    }
    let releaseDate: String
    let runtime: Int
    let voteAverage: Double
    let voteCount: Int
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case adult, budget, homepage, overview, popularity, runtime, tagline
        case backdropPath = "backdrop_path"
        case collection = "belongs_to_collection"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}

class MovieDetailsViewModel {
    
    private var movieId: Int = 0
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var movieDetails = PassthroughSubject<MovieDetailsModel,NetworkError>()
    
    func fetchMovieDetails() {
        let router = ApiRouter.fetchMovieDetails(movieId: movieId)
        NetworkService.shared.request(router: router) { (result: Result<MovieDetailsModel, NetworkError>) in
            switch result {
            case .success(let success):
                self.movieDetails.send(success)
            case .failure(let failure):
                self.movieDetails.send(completion: .failure(failure))
            }
        }
    }
    
}
