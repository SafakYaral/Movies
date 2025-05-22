//
//  KategoriItem.swift
//  FilmlerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct KategoriItem: View {
    var kategori = Kategoriler()
    
    var body: some View {
        Text(kategori.kategori_ad!)
    }
}

/*struct KategoriItem_Previews: PreviewProvider {
    static var previews: some View {
        KategoriItem()
    }
}*/
