//
//  FilmItem.swift
//  FilmlerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct FilmItem: View {
    var film = Filmler()
    var genislik = 0.0
    var body: some View {
        VStack(spacing: 5){
            Image(film.film_resim!).resizable().frame(width: genislik)
            Text(film.film_ad!).foregroundColor(.gray)
            Text("Sepete Ekle")
                .padding(5)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(5)
                .padding(.bottom,5)
                .onTapGesture {
                    print("\(film.film_ad!) sepete eklendi")
                }
        }.background(Rectangle().fill(.white).shadow(radius: 3))
    }
}

/*struct FilmItem_Previews: PreviewProvider {
    static var previews: some View {
        FilmItem()
    }
}*/
