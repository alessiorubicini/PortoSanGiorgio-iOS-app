//
//  ActivitiesView.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

struct ActivitiesView: View {
    
    let activities: [Activity]
    
    @State private var selectedType = ActivitySector.food
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                // Activity sector picker
                Picker(selection: $selectedType, label: Text("")) {
                    
                    ForEach(ActivitySector.allCases) { sector in
                        Text("\(sector.rawValue)").tag(sector)
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Search bar
                
                
                // Activity list
                
                ScrollView {
                    ForEach(activities.filter({$0.sector.rawValue == selectedType.rawValue})) { activity in
                        ActivityCard(activity: activity)
                            .padding(.horizontal)
                            
                            .onTapGesture {
                                showSheet.toggle()
                            }
                        
                            .sheet(isPresented: $showSheet) {
                                ActivitySheet(activity: activity, showSheet: $showSheet)
                            }
                    }
                }
                
            }
            
            .navigationTitle("Attività")
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: Activity.activityMocks)
    }
}
