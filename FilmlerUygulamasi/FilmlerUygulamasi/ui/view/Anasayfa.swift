//
//  Anasayfa.swift
//  FilmlerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct Anasayfa: View {
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){ kategori in
                    NavigationLink(destination: FilmSayfa(kategori: kategori)){
                        KategoriItem(kategori: kategori)
                    }
                }
            }.navigationTitle("Kategoriler")
                .onAppear{
                    veritabaniKopyala()
                    viewModel.kategorileriYukle()
                }
        }
    }
    func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı daha önce kopyalandı.")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}

struct Anasayfa_Previews: PreviewProvider {
    static var previews: some View {
        Anasayfa()
    }
}
