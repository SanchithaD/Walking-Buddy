//
//  WalkorBike.swift
//  HackWalk
//
//  Created by Kalyani Tumuluri on 11/23/19.
//  Copyright © 2019 Sanchitha. All rights reserved.
//

import SwiftUI

struct WalkorBike: View {
    var body: some View {
     
        VStack {
        
            Text("Way of transportation:")
                .font(.largeTitle)
                .frame(width: 1000, height: 100)
            
                Text("Bike")
                    .font(.title)
                    .frame(width: 300, height: 70)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            
                    .padding(100)
            
                Text("Walk")
                    
                    .font(.title)
                    .frame(width: 300, height:70)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            
            }
        
        
        }
    
}
    



    
    
