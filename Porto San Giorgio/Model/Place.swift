//
//  Place.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import Foundation
import SwiftUI

struct Place: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let description: String
    let address: String
    let image: Data
    let latitude: Double
    let longitude: Double
    
    init(id: UUID = UUID(), name: String, descr: String, address: String, image: UIImage, coordinates: (Double, Double)) {
        self.id = id
        self.name = name
        self.description = descr
        self.address = address
        self.image = image.pngData()!
        self.latitude = coordinates.0
        self.longitude = coordinates.1
    }
    
}


extension Place {
    
    static let placeMocks: [Place] = [
        Place(name: "Porto Turistico", descr: "", address: "Via Gramsci Sud 485", image: UIImage(named: "alba-porto")!, coordinates: (43.166098, 13.810901)),
        Place(name: "Chiesa San Giorgio Martire", descr: "", address: "Piazza San Giorgio 7", image: UIImage(named: "chiesa")!, coordinates: (43.180515, 13.792692)),
        Place(name: "Rocca tiepolo", descr: "", address: "Via Leonardo da Vinci 3", image: UIImage(named: "rocca")!, coordinates: (43.180621, 13.791779)),
        Place(name: "Villa Bonaparte", descr: "", address: "Via Bonaparte", image: UIImage(named: "villaBonaparte")!, coordinates: (43.178879, 13.792882))
    
    ]
    
}
