//
//  RoundedImage.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

struct RoundedImage: View {
    
    let name: String
    let author: String
    let tapAnimation = Animation.linear.speed(0.2)
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25)
                .shadow(radius: 15)
                .padding()
            
            Label(author, systemImage: "photo")
        }
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(name: "Tramonto", author: "Alessio Rubicini")
    }
}
