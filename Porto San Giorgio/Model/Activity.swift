//
//  Activity.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import Foundation
import SwiftUI

struct Activity: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let address: String
    let type: ActivityType
    let sector: ActivitySector
    let image: Data
    let website: URL
    let latitude: Double
    let longitude: Double
    
    init(name: String, address: String, type: ActivityType, sector: ActivitySector, image: UIImage, website: String, coords: (Double, Double)) {
        self.id = UUID()
        self.name = name
        self.address = address
        self.sector = sector
        self.type = type
        self.image = image.pngData()!
        self.website = URL(string: website)!
        self.latitude = coords.0
        self.longitude = coords.1
    }
}

enum ActivityType: String, Codable, CaseIterable {
    case supermarket = "Supermercato"
    case clotes = "Abbigliamento"
    case tech = "Tecnologia"
    case antiques = "Antiquariato"
    case drugstore = "Farmacia"
    case book = "Libreria"
    case hotel = "Hotel"
    case pizzeria = "Pizzeria"
    case restaurant = "Ristorante"
    case iceCreamShop = "Gelateria"
    case bar = "Bar"
    case tobacconist = "Tabaccheria"
}

enum ActivitySector: String, Codable, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case food = "Cibo"
    case shopping = "Shopping"
    case salute = "Salute"
    case hotel = "Hotel"
    case other = "Altro"
}

extension Activity {
    
    static let activityMocks: [Activity] = [
        Activity(name: "Pizzeria Cip&Ciop", address: "Via Oberdan 10", type: .pizzeria, sector: .food, image: UIImage(named: "cipciop")!, website: "https://pizzeriacipeciop.com", coords: (43.180576, 13.797869)),
        Activity(name: "Mondadori Store", address: "Viale Don Giovanni Minzoni", type: .book, sector: .shopping, image: UIImage(named: "mondadori")!, website: "https://pizzeriacipeciop.com", coords: (43.180933, 13.795948)),
        Activity(name: "Six Feet Under", address: "", type: .clotes, sector: .shopping, image: UIImage(named: "sixfeet")!, website: "https://pizzeriacipeciop.com", coords: (43.180098, 13.795085))
    ]
    
}

