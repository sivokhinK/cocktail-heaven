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
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 5)
            
            VStack {
                Text(recipe.name).font(.headline)
                
                // TODO: add tags
                HStack() {
                    Text("TAG")
                        .font(.subheadline)
                        .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
                        .background {
                            RoundedRectangle(cornerRadius: 5).fill(Color.tagCell)
                        }
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 5)
            
            Spacer()
        }
        .frame(width: 312, height: 85)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.recipeCell)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    RecipeListCell(recipe: MockData.sampleRecipe)
}
