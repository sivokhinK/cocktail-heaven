//
//  IngredientButton.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 28.12.2023.
//

import SwiftUI

struct IngredientButton: View {
    
    @Binding var buttonTapped: Bool
    
    var body: some View {
        Button {
            if buttonTapped { buttonTapped.toggle() }
        } label: {
            Text("Ingredient").font(.title3)
        }
        .frame(width: 147, height: 37)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(.inactiveButton))
    }
}

#Preview {
    IngredientButton(buttonTapped: .constant(false))
}
