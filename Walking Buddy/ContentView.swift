//
//  ContentView.swift
//  Walking Buddy
//
//  Created by Sanchitha Dinesh on 11/23/19.
//  Copyright © 2019 Sanchitha. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Equatable {
    static func ==(lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID().uuidString
    let name: String
    let location: CLLocationCoordinate2D
}

struct ContentView: View {
    @State var landmarks: [Landmark] = [
        Landmark(name: "Shashwath", location: .init(latitude: 37.301730,
        longitude: -122.013790)),
        Landmark(name: "Sarasvati", location: .init(    latitude: 37.302610, longitude: -122.015740)),
        Landmark(name: "Vaishnavi", location: .init(latitude: 37.294010,
        longitude: -122.018960)),
        Landmark(name: "Shailesh", location: .init(latitude: 37.305050, longitude: -121.998000)),
        Landmark(name: "Chitrini", location: .init(latitude: 37.303280, longitude: -122.015390)),
        Landmark(name: "Avni", location: .init(latitude: 37.303822, longitude: -122.013489)),
        Landmark(name: "Medha", location: .init(latitude: 37.303110, longitude: -122.013850)),



    ]
    
    @State var selectedLandmark: Landmark? = nil
    
    var body: some View {
        ZStack {
            MapView(landmarks: $landmarks,
                    selectedLandmark: $selectedLandmark)
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Spacer()
                Button(action: {
                    self.selectNextLandmark()
                }) {
                    Text("Next")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        .padding(.bottom)
                }
            }
        }
    }
    
    private func selectNextLandmark() {
        if let selectedLandmark = selectedLandmark, let currentIndex = landmarks.firstIndex(where: { $0 == selectedLandmark }), currentIndex + 1 < landmarks.endIndex {
            self.selectedLandmark = landmarks[currentIndex + 1]
        } else {
            selectedLandmark = landmarks.first
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
