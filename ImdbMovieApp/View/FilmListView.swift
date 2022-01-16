//
//  ContentView.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 15.01.2022.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.searchFilm(search: "Titanic")
    }
    
    var body: some View {
        List(filmListViewModel.films,id: \.imdbId) { film in
            Text(film.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
