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
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .badge(num: badgeCount)
            Stepper("Update", value: $badgeCount.animation())
        }
        .badgeColor(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
