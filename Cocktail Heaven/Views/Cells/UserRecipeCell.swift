//
//  UserRecipeCell.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 15.04.2024.
//

import SwiftUI

struct UserRecipeCell: View {
    
    let recipe: UserRecipe
    
    var body: some View {
        HStack {
            Text(recipe.name)
                .padding(10)
            
            Spacer()
        }
        .font(.title3.weight(.semibold))
        .frame(maxWidth: .infinity)
        .background(
            Color(
                red: recipe.colorRGB[0],
                green: recipe.colorRGB[1],
                blue: recipe.colorRGB[2]
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    UserRecipeCell(recipe: UserRecipeMockData.sampleUserRecipe)
}
