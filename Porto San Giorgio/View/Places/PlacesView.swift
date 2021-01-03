//
//  PlacesView.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI
import MapKit

struct PlacesView: View {
    
    let places: [Place]
    let layout = Array.init(repeating: GridItem(.flexible()), count: 2)
    
    @State private var showSheet = false
    @State private var viewType = PlacesViewType.list
    
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.181873, longitude: 13.795013), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            
            VStack {
                // Activity sector picker
                Picker(selection: $viewType, label: Text("")) {
                    
                    ForEach(PlacesViewType.allCases) { type in
                        Text("\(type.rawValue)").tag(type)
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if viewType == .map {
                    Map(coordinateRegion: $coordinateRegion, annotationItems: places) { place in
                        
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)) {
                            VStack {
                                ZStack {
                                    Circle().fill(Color.blue).frame(width: 30, height: 30)
                                    Image(systemName: "mappin.circle.fill").foregroundColor(.white)
                                }
                                Text(place.name).foregroundColor(.black).font(.caption).fontWeight(.semibold)
                                    .padding(5)
                            }

                        }
                        
                        
                    }
                    .cornerRadius(10)
                    .padding(20)
                    
                } else {
                    
                    VStack {
                        
                        
                        
                        // List
                        List {
                            ForEach(places) { place in
                                PlaceCard(place: place)
                            }
                        }
                        .listStyle(InsetListStyle())
                    }
                }
            }
            .navigationTitle("Luoghi di interesse")
            
        
            
        }
    }
    
    private enum PlacesViewType: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        
        case map = "Mappa"
        case list = "Lista"
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(places: Place.placeMocks)
    }
}
