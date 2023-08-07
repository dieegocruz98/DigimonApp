//
//  DigimonCellView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import SwiftUI

struct DigimonCellView: View {
    
    var digimon: Digimon
    
    init(digimon: Digimon) {
        self.digimon = digimon
    }
    
    var body: some View {
        VStack(alignment: .leading, content: { // Para alinear al inicio
            HStack(content: {
                // Para el row
                // Imagen
                AsyncImage(url: URL(string: digimon.img),
                           content: { image in
                               image.resizable()
                        .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 73)
                           },
                           placeholder: {
                               ProgressView()
                           })

                
                // Nombre y descripción alineados al principio
                VStack (alignment: .leading, content: {
                    Text(digimon.name)
                        .fontWeight(.semibold)
                        //.font(.title3)
                        .font(.system(size: 14))
                    //Text(digimon.level)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(3)
                })
                
            })
        })
        
    }
}

struct DigimonCellView_Previews: PreviewProvider {
    static var previews: some View {
        DigimonCellView(digimon: Digimon(id: 0, name: "Koromon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In training"))
    }
}
