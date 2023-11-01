//
//  RecipeListCell.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct RecipeListCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack() {
            Image(.longIslandTea)
                .resizable()
                .frame(width: 75, height: 75)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 312, height: 85)
                .foregroundStyle(.recipeListCell)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25),
                        radius: CGFloat(4),
                        x: CGFloat(0), y: CGFloat(4))

        }
    }
}

#Preview {
    RecipeListCell(recipe: MockData.sampleRecipe)
}
