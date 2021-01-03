//
//  ActivitySheet.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

struct ActivitySheet: View {
    
    let activity: Activity
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Mappa
                MapView(placeName: activity.name, lat: activity.latitude, long: activity.longitude, delta: 0.002, addMark: true)
                    .frame(height: 200)
                    .edgesIgnoringSafeArea(.top)
                
                
                // Immagine
                Image(uiImage: UIImage(data: activity.image)!)
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .offset(y: -150)
                    .padding(.bottom, -120)
                
                // Informazioni
                VStack(alignment: .leading) {
                    Group {
                        // Nome
                        Text(activity.name).font(.title).fontWeight(.semibold)
                        
                        // Settore
                        Text("\(activity.type.rawValue) - \(activity.sector.rawValue)")
                        
                        // Indirizzo
                        Label(activity.address, systemImage: "mappin.and.ellipse")
                        
                        // Sito web
                        
                    }.padding(5)
                    
                    
                    Spacer()
                    
                }
                .padding()
                
                Spacer()
            }
            
            .navigationBarItems(leading: Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Chiudi").foregroundColor(.red)
            }))
            
            
        }
    }
}

struct ActivitySheet_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySheet(activity: Activity.activityMocks[0], showSheet: .constant(true))
    }
}
