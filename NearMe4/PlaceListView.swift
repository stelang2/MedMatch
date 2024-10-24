//
//  PlaceListView.swift
//  NearMe2
//
//
//  PlaceListView.swift
//  NearMeProject
//
//  Created by Shivum telang on 7/4/24.
//

//
//  PlaceListView.swift
//  NearMeAppSwiftUI
//
//  Created by Mohammad Azam on 2/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 30)
                .background(Color.gray)
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            
            List {
                
                ForEach(self.landmarks, id: \.id) { landmark in
                    
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .fontWeight(.bold)
                        
                        Text(landmark.title)
                       
                    }
                }
                
            }.transaction { transaction in
                transaction.animation = nil
            }
            
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
      //  PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
        ContentView(sharedData: SharedData())
    }
}
