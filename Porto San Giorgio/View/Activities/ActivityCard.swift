//
//  ActivityCard.swift
//  Porto San Giorgio
//
//  Created by Alessio Rubicini on 01/01/21.
//

import SwiftUI

struct ActivityCard: View {
    
    let activity: Activity
    
    var body: some View {
        HStack {
            
            Image(uiImage: UIImage(data: activity.image)!)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .padding(10)

            VStack(alignment: .leading) {
                Text(activity.name).font(.headline)
                Text(activity.address).font(.callout)
                Text(activity.type.rawValue).font(.callout)
            }.padding(.trailing)
            
            Spacer()
            
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity.activityMocks[0])
            .previewLayout(.sizeThatFits)
    }
}
