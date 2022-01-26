//
//  ContentView.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 15.01.2022.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject private var filmListViewModel: FilmListViewModel

    @State private var searchKey = ""
    @State private var num: String = ""

    init() {
        self.filmListViewModel = FilmListViewModel()
    }

    var body: some View {
        NavigationView {

            VStack {
                TextField("Aracanacak Film", text: self.$searchKey, onEditingChanged: { _ in }, onCommit: {
                        self.filmListViewModel.searchFilm(search: self.searchKey)
                    }).padding()
                    .textFieldStyle(.roundedBorder)

                List(filmListViewModel.films, id: \.imdbId) { film in
                    NavigationLink(destination: FilmDetailView(filmId: film.imdbId)) {
                        FilmCard(film: film)
                    }

                }.navigationTitle("Filmler")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
