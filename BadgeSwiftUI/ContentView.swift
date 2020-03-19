//
//  ContentView.swift
//  BadgeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 18/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct BadgeView: View {
    var num: Int
    @Environment(\.badgeColor) var envBadgeColor
    var body: some View {
            Circle()
                .fill(envBadgeColor ?? Color.red)
                .frame(width: 24, height: 24)
                .overlay(Text(num.description))
    }
}

extension View {
    func badge(num: Int) -> some View {
        return self.overlay(
            VStack {
                if num > 0 {
                    BadgeView(num: num)
                        .animation(nil)
                        .transition(.scale)
                }
            }
            .alignmentGuide(.trailing) { $0[VerticalAlignment.center] }
            .alignmentGuide(.top) { $0[HorizontalAlignment.center] }
            , alignment: .topTrailing)
    }
}

struct BadgeColorKey: EnvironmentKey {
    static var defaultValue: Color? = nil
}

extension EnvironmentValues {
    var badgeColor: Color? {
        get { self[BadgeColorKey.self] }
        set { self[BadgeColorKey.self] = newValue }
    }
}

extension View {
    func badgeColor(_ color: Color?) -> some View {
        environment(\.badgeColor, color)
    }
}


struct ContentView : View {
    
    @State var badgeCount = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .badge(num: badgeCount)
            Stepper("Update", value: $badgeCount.animation())
        }.badgeColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
