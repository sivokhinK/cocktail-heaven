//
//  CustomModifiers.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 17.11.2023.
//

import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    let isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(width: 312, height: 50)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.inactiveButton)
                    .stroke(isFocused ? .searchFieldActiveStroke : .searchFieldStroke, lineWidth: 2)
            }
    }
}

extension View {
    func standardTextFieldModifier(isFocused: Bool) -> some View {
        self.modifier(StandardTextFieldModifier(isFocused: isFocused))
    }
}

extension Image {
    func standardRecipeDetailImageModifier() -> some View {
        self
            .resizable()
            .frame(width: 170, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(10)
    }
}

extension Color {
    static func random() -> [Double] {
        [
            .random(in: 0...1),
            .random(in: 0...1),
            .random(in: 0...1)
        ]
    }
}
