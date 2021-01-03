//
//  Porto_San_GiorgioApp.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

@main
struct Porto_San_GiorgioApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                CityView(topics: Topic.topicMocks)
                    .tabItem {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("Città")
                    }
                
                ActivitiesView(activities: Activity.activityMocks)
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Attività")
                    }
                
                PlacesView(places: Place.placeMocks)
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Luoghi")
                    }
                
                InfoView()
                    .tabItem {
                        Image(systemName: "info.circle.fill")
                        Text("Info")
                    }
                
            }
            
        }
    }
}
