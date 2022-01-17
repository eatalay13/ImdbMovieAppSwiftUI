//
//  FilmDetailView.swift
//  ImdbMovieApp
//
//  Created by Emrah Atalay on 17.01.2022.
//

import SwiftUI

struct FilmDetailView: View {
    @ObservedObject var detailViewModel = FilmDetailViewModel()
    
    init(filmId : String) {
        detailViewModel.getFilmDetail(imdbId: filmId)
    }
    
    var body: some View {
        VStack{
            CustomImageView(urlString: detailViewModel.filmDetail?.poster ?? "")
            
            Text(detailViewModel.filmDetail?.title ?? "Başlık")
                .font(.title)
                .foregroundColor(.orange)
                .padding()
            
            Text(detailViewModel.filmDetail?.plot ?? "Plot")
                .font(.body)
                .foregroundColor(.gray)
                .padding()
            
            Text("Yıl : \(detailViewModel.filmDetail?.year ?? "")")
                .padding()
            
            Text("Yönetmen : \(detailViewModel.filmDetail?.director ?? "")")
                .padding()
            
            Text("Yazar : \(detailViewModel.filmDetail?.writer ?? "")")
                .padding()
            
            Text("Ödüller : \(detailViewModel.filmDetail?.awards ?? "")")
                .padding()
        }
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView(filmId: "tt1201607")
    }
}
