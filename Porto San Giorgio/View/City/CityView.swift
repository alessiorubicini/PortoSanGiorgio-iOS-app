//
//  CityView.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI
import MapKit

struct CityView: View {
    
    let topics: [Topic]
    
    let appleMaps = URL(string: "https://maps.apple.com/?address=Porto%20San%20Giorgio,%20Fermo,%20Italia&auid=2544599056781052254&ll=43.183778,13.794389&lsp=7618&q=Porto%20San%20Giorgio&_ext=Ch8KBQgEEJABCgQIBRADCgQIBhADCgQIChAJCgQIVRAJEiYpjwMKUK6URUAxM6g2OBGFK0A5XdYOkHmZRUBBunFBbJ+gK0BQDA%3D%3D")!
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                List {
                    Section(header: Text("Posizione")) {
                        MapView(placeName: "Porto San Giorgio", lat: 43.181873, long: 13.795013, delta: 2, addMark: true)
                            .frame(height: 200)
                            //.cornerRadius(10)
                            .padding(.vertical, -10)
                            .padding(.horizontal, -20)
                        
                        Link(destination: appleMaps) {
                            Label("Apri in Apple Maps", systemImage: "map.fill")
                        }

                    }
                    
                    Section(header: Text("Informazioni")) {
                        ForEach(topics) { topic in
                            NavigationLink(destination: TopicView(topic: topic).navigationTitle(topic.title)) {
                                Label(topic.title, systemImage: topic.icon)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
                .navigationTitle("La città")
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(topics: Topic.topicMocks)
    }
}
