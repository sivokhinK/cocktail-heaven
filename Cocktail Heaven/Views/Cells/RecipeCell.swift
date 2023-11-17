//
//  RecipeListCell.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            Image(.longIslandTea)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 5)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(recipe.name).font(.headline)
                
                // TODO: add tags
                HStack(spacing: 6) {
                    ForEach(0..<3) { _ in
                        Text("TAG")
                            .font(.caption)
                            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
                            .background(RoundedRectangle(cornerRadius: 5).fill(.tagCell))
                    }
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 5)
            
            Spacer()
            
            VStack {
                Image(systemName: "heart")
                    .padding(.top, 7)
                    .padding(.trailing, 7)
                Spacer()
            }
        }
        .frame(width: 312, height: 85)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.recipeCell)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    RecipeCell(recipe: MockData.sampleRecipe)
}
