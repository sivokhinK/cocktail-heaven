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
                
                List {
                    ForEach(userRecipes) { recipe in
                        UserRecipeCell(recipe: recipe)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 8,
                                                 leading: 25,
                                                 bottom: 8,
                                                 trailing: 25))
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            deleteRecipe(userRecipes[index])
                        }
                    }
                }
                .listStyle(.plain)
            }

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
            // TODO: Sheet with recipe details
        }
    }
    
    func addRecipe() {
        let recipe = UserRecipe(name: "Vodka Tonic", instructions: "Instruction", ingredients: ["vodka", "tonic"])
        context.insert(recipe)
    }
    
    func deleteRecipe(_ recipe: UserRecipe) {
        context.delete(recipe)
    }
}

#Preview {
    NewRecipeView()
}
