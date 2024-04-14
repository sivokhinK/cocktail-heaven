//
//  UserRecipe.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 14.04.2024.
//

import Foundation
import SwiftData

@Model
class UserRecipe: Identifiable {
    let id: UUID
    let name: String
    let instructions: String
    let ingredients: [String]
    
    init(name: String, instructions: String, ingredients: [String]) {
        self.id = UUID()
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
    }
}

struct UserRecipeMockData {
    
    static let sampleUserRecipe = UserRecipe(
        name: "Gin Tonic",
        instructions: "Fill a highball glass with ice, pour the gin, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.",
        ingredients: ["4 cl Gin", "10 cl Tonic Water", "1 Slice Lemon Peel", "cubes Ice"]
    )
    
    static let userRecipes = [sampleUserRecipe, sampleUserRecipe, sampleUserRecipe]
}
