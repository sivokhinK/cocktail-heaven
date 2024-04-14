//
//  NewRecipeView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI
import SwiftData

struct NewRecipeView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var userRecipes: [UserRecipe]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                MainTitleCH(title: "Add New Recipe")
                
                ScrollView {
                    ForEach(userRecipes) { recipe in
                        HStack {
                            Text(recipe.name)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)

            Button {
                addRecipe()
            } label: {
                Image(systemName: "plus")
                    .font(.title2.weight(.semibold))
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
            }
            .padding()
        }
    }
    
    func addRecipe() {
        let recipe = UserRecipe(name: "Vodka Tonic", instructions: "Instruction", ingredients: ["vodka", "tonic"])
        context.insert(recipe)
    }
}

#Preview {
    NewRecipeView()
}
