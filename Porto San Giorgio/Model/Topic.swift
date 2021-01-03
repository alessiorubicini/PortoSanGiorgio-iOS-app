//
//  Topic.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import Foundation

struct Topic: Identifiable, Codable {
    
    let id: UUID
    let title: String
    let icon: String
    let texts: [String]
    let images: [Data]
    
    init(title: String, icon: String, texts: [String], images: [Data]) {
        self.id = UUID()
        self.title = title
        self.icon = icon
        self.texts = texts
        self.images = images
    }
}

extension Topic {
    
    static let topicMocks = [
        Topic(title: "Storia", icon: "books.vertical.fill", texts: [], images: []),
        Topic(title: "Cucina", icon: "gauge", texts: [], images: []),
        Topic(title: "Mare", icon: "sun.haze", texts: [], images: []),
        Topic(title: "Trasporti", icon: "bicycle", texts: [], images: []),
        Topic(title: "Economia", icon: "eurosign.circle", texts: [], images: []),
        Topic(title: "Dialetto", icon: "bubble.left.and.bubble.right", texts: [], images: [])
        
        
    ]
    
}
