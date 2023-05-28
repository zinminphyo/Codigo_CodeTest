//
//  MovieListsViewModel.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import Combine


/*
 
 "adult": false,
 "backdrop_path": "/hJoMSAltRx5xvlAXvKyDdugjucJ.jpg",
 "genre_ids": [
     12,
     10751,
     14,
     10749
 ],
 "id": 447277,
 "original_language": "en",
 "original_title": "The Little Mermaid",
 "overview": "The youngest of King Triton’s daughters, and the most defiant, Ariel longs to find out more about the world beyond the sea, and while visiting the surface, falls for the dashing Prince Eric. With mermaids forbidden to interact with humans, Ariel makes a deal with the evil sea witch, Ursula, which gives her a chance to experience life on land, but ultimately places her life – and her father’s crown – in jeopardy.",
 "popularity": 2118.742,
 "poster_path": "/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg",
 "release_date": "2023-05-18",
 "title": "The Little Mermaid",
 "video": false,
 "vote_average": 5.8,
 "vote_count": 182
}
 */

struct Movie: Decodable {
    
    let adult: Bool
    let backdropPath: String
    var backdropFullPath: String {
        return "https://image.tmdb.org/t/p/original/" + backdropPath
    }
    let genreIds: [Int]
    let id: Int
    let language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let posterPath: String
    var posterFullPath: String {
        return "https://image.tmdb.org/t/p/original/" + posterPath
    }
    let releaseDate: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, title, video, original_title
        case backdropPath = "backdrop_path"
        case genreIds  = "genre_ids"
        case language = "original_language"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
}

class MovieListsViewModel {
    
    var popularLists: PassthroughSubject<[Movie], NetworkError> = PassthroughSubject()
    var upcomingLists: PassthroughSubject<[Movie], NetworkError> = PassthroughSubject()
    
    
    func fetchPopularMovieLists() {
        let router = ApiRouter.fetchPopularMovieLists(language: "en-US", page: 1)
        NetworkService.shared.request(router: router) { (result: Result<PaginationResponseModel<Movie>, NetworkError>) in
            switch result {
            case .success(let success):
                self.popularLists.send(success.results)
            case .failure(let failure):
                self.popularLists.send(completion: .failure(failure))
            }
        }
    }
    
    func fetchUpcomingMovieLists() {
        let router = ApiRouter.fetchUpcomingMovieLists(language: "en-US", page: 1)
        NetworkService.shared.request(router: router) { (result: Result<PaginationResponseModel<Movie>, NetworkError>) in
            switch result {
            case .success(let success):
                self.upcomingLists.send(success.results)
            case .failure(let failure):
                self.upcomingLists.send(completion: .failure(failure))
            }
        }
    }
    
    
}
