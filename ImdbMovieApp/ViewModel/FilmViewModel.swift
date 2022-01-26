//
//  FilmViewModel.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 16.01.2022.
//

import Foundation

class FilmListViewModel: ObservableObject {

    @Published var films = [Film]()

    private let _downloaderClient = DownloaderClient()

    func searchFilm(search: String) {
        _downloaderClient.searchFilm(search: search) { result in

            switch result {
            case .failure(let err):
                print(err)

            case .success(let apiFilms):
                if apiFilms != nil {
                    DispatchQueue.main.async {
                        self.films = apiFilms!
                    }
                }
            }
        }
    }
}
