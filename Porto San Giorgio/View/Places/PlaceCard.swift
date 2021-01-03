//
//  PlaceCard.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

struct PlaceCard: View {
    
    let place: Place
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: place.image)!).resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Text(place.name).multilineTextAlignment(.leading)
                .font(.headline)
                .padding(.leading, 30)
        }
    }
}

struct PlaceCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCard(place: Place.placeMocks[0])
    }
}
