//
//  DownloaderClient.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 16.01.2022.
//

import Foundation
import SwiftUI

class DownloaderClient {
    
    func searchFilm(search : String, completion: @escaping (Result<[Film]?,DownloaderError>)-> Void) {
        let urlFormat = search.trimmingCharacters(in: .whitespacesAndNewlines)
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(urlFormat)&apikey=8e58179f") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                return completion(.failure(.emptyData))
            }
            
            guard let apiFilms = try? JSONDecoder().decode(ApiFilmList.self, from: data) else {
                return completion(.failure(.dataNotProcess))
            }
            
            return completion(.success(apiFilms.films))

        }.resume()
    }
    
    func filmDetail(filmId : String, completion: @escaping (Result<FilmDetail?,DownloaderError>)-> Void) {
        let urlFormat = filmId.trimmingCharacters(in: .whitespacesAndNewlines)
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(urlFormat)&apikey=8e58179f") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                return completion(.failure(.emptyData))
            }
            
            guard let apiFilm = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.dataNotProcess))
            }
            
            return completion(.success(apiFilm))
            
        }.resume()
    }
}

enum DownloaderError : Error {
    case wrongUrl
    case emptyData
    case dataNotProcess
}
