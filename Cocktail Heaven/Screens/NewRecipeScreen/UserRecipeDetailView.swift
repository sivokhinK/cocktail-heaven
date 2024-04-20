//
//  UserRecipeDetailView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 20.04.2024.
//

import SwiftUI

struct UserRecipeDetailView: View {
    let recipe: UserRecipe
    
    var body: some View {
        VStack {
            Text(recipe.name)
            Text(recipe.instructions)
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
    }
}

#Preview {
    UserRecipeDetailView(recipe: UserRecipeMockData.sampleUserRecipe)
}
