//
//  BadgeView.swift
//  BadgeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 24/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import SwiftUI

struct BadgeView: View {
    
    var num: Int
    @Environment(\.badgeColor) var badgeColor
    
    var body: some View {
        Circle()
            .fill(badgeColor)
            .frame(width: 24, height: 24)
            .overlay(Text(num.description))
            .transition(.scale)

    }
}

extension View {
    func badge(num: Int) -> some View {
        overlay(
            ZStack {
                if num > 0 {
                    BadgeView(num: num)
                }
            }
            .alignmentGuide(.trailing, computeValue: { $0[.trailing] / 2 })
            .alignmentGuide(.top, computeValue: { $0[.bottom] / 2 })
            , alignment: .topTrailing)
    }
}

struct BadgeColorKey: EnvironmentKey {
    static let defaultValue = Color.red
}

extension EnvironmentValues {
    var badgeColor: Color {
        get { self[BadgeColorKey.self] }
        set { self[BadgeColorKey.self] = newValue }
    }
}

extension View {
    func badgeColor(_ color: Color)  -> some View {
        environment(\.badgeColor, color)
    }
}
