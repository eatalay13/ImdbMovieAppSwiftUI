//
//  FilmDetailViewModel.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 17.01.2022.
//

import Foundation

class FilmDetailViewModel : ObservableObject {
    @Published var filmDetail : FilmDetail? = nil
    
    private let _downloaderClient = DownloaderClient()
    
    func getFilmDetail(imdbId : String){
        _downloaderClient.filmDetail(filmId: imdbId) { result in
            
            switch result {
                case .failure(let err):
                    print(err)
                    
                case .success(let apiFilm):
                    if apiFilm != nil {
                        DispatchQueue.main.async {
                            self.filmDetail = apiFilm
                        }
                    }
            }
        }
    }
}
