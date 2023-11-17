//
//  Recipe.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import Foundation

struct Recipe: Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let tags: [String]
}

struct MockData {
    
    static let sampleRecipe = Recipe(
        id: 0001,
        name: "Long Island Tea",
        description: "Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.",
        imageURL: ".long_island_tea.jpeg",
        tags: ["IBA", "CONTEMPORARYCLASSIC", "ALCOHOLIC", "USA", "ASIA", "VEGAN"]
    )
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe]
}
