//
//  Film.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 15.01.2022.
//

import Foundation

// Api'den gelen film modeli
struct Film: Codable {
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}


// Api'den gelen sonuç modeli
struct ApiFilmList: Codable {
    let films: [Film]

    private enum CodingKeys: String, CodingKey {
        case films = "Search"
    }
}
