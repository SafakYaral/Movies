//
//  ContentView.swift
//  FilmlerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct FilmSayfa: View {
    @ObservedObject var viewModel = FilmSayfaViewModel()
    
    var kategori = Kategoriler()
    
    var body: some View {
        
            GeometryReader{ geometry in
                let ekranGenislik = geometry.size.width
                let itemGenislik = (ekranGenislik-40)/2
                //10 X 20 X 10 = 40
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                        ForEach(viewModel.filmlerListesi){ film in
                            NavigationLink(destination: DetaySayfa(film:film)){
                                FilmItem(film: film,genislik: itemGenislik)
                            }
                            
                        }
                    }
                }.padding(10)
                    .navigationTitle(kategori.kategori_ad!)
                    .onAppear{
                        viewModel.filmleriYukle(kategori_id: kategori.kategori_id!)
                    }
            }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmSayfa()
    }
}*/
