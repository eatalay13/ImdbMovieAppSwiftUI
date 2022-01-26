//
//  FilmCard.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 16.01.2022.
//

import SwiftUI

struct FilmCard: View {
    var film: Film
    var body: some View {
        HStack {
            CustomImageView(urlString: film.poster)
                .frame(width: 100, height: 150)

            VStack(alignment: .leading) {
                Text(film.title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)

                Text(film.year)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct FilmCard_Previews: PreviewProvider {
    static var previews: some View {
        FilmCard(film: Film(title: "Harry", year: "2001", imdbId: "1212", type: "sa", poster: "https://media.istockphoto.com/photos/business-man-pushing-large-stone-up-to-hill-business-heavy-tasks-and-picture-id825383494?k=20&m=825383494&s=612x612&w=0&h=tEqZ5HFZcM3lmDm_cmI7hOeceiqy9gYrkyLTTkrXdY4=")).previewLayout(.sizeThatFits)
    }
}
