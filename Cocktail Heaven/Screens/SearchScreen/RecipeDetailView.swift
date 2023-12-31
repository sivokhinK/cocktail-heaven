//
//  RecipeDetailView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 27.12.2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: RecipeDetailed
    
    private let baseIngredientURLString1 = "https://thecocktaildb.com/images/ingredients/"
    private let baseIngredientURLString2 = "-Medium.png"
//    private let mockBaseIngredientURLString = "https://thecocktaildb.com/images/ingredients/vodka-Medium.png"
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    // TODO: Pass image to this view from its parrent.
                    AsyncImage(url: URL(string: recipe.imageURL)) { image in
                        image
                            .standardRecipeDetailImageModifier()
                    } placeholder: {
                        Image(systemName: "photo")
                            .standardRecipeDetailImageModifier()
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(recipe.name)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    .frame(width: 170, height: 170)
                    .padding(.top, 15)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                    
                    Text(recipe.instructions)
                }
                .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    
                    // TODO: factor out ingredient to cell
                    LazyVGrid(columns: columns) {
                        ForEach(0..<recipe.ingredients.count, id: \.self) { i in
                            VStack {
                                Text(recipe.ingredients[i])
                                
                                let url = baseIngredientURLString1 + recipe.ingredients[i] + baseIngredientURLString2
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                }
                                
                                // There can by less measures then ingredients.
                                if recipe.measures.count - 1 >= i {
                                    Text(recipe.measures[i])
                                }
                            }
                            .padding(.bottom, 25)
                        }
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 5)
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    RecipeDetailView(recipe: RecipeDetailed(recipe: MockData.sampleRecipeDetailed))
}
