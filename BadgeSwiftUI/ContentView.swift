//
//  ContentView.swift
//  BadgeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 18/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var badgeCount = 0
    
    var body: some View {
        VStack {
            Text("Badge View").font(.largeTitle)
            Rectangle()
                .fill(Color.clear)
                .border(Color.black)
                .frame(width: 100, height: 100)
            .overlay(
                Image(systemName: "person")
                .resizable()
                    .foregroundColor(.gray)
            )
                .badge(num: badgeCount)
            Stepper("Update", value: $badgeCount.animation()).font(.headline)
            Spacer()
        }
        .padding()
        .badgeColor(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
