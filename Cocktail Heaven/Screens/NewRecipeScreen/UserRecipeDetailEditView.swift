//
//  UserRecipeDetailEditView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 20.04.2024.
//

import SwiftUI

struct UserRecipeDetailEditView: View {
    let recipe: UserRecipe
    
    @Binding var isPresentingEditView: Bool
    
    @State private var name = ""
    @State private var instructions = ""
    
    var body: some View {
        Form {
            Section("Name") {
                TextField(recipe.name, text: $name)
            }
            
            Section("Instructions") {
                TextField(recipe.instructions, text: $instructions)
            }
            
            
            // TODO: Add ingredients
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    isPresentingEditView = false
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    save()
                    isPresentingEditView = false
                }
            }
        }
    }
    
    private func save() {
        recipe.name = name
        recipe.instructions = instructions
    }
}

#Preview {
    UserRecipeDetailEditView(recipe: UserRecipeMockData.sampleUserRecipe, isPresentingEditView: .constant(false))
}
