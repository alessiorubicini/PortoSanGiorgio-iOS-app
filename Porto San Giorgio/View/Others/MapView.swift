//
//  MapView.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let placeName: String
    let lat: Double
    let long: Double
    let delta: Double
    let addMark: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        if self.addMark {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate

            annotation.title = placeName
            uiView.addAnnotation(annotation)
        }
    }}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(placeName: "Porto turistico", lat: 43.180574, long: 13.797923, delta: 0.001, addMark: true)
    }
}
