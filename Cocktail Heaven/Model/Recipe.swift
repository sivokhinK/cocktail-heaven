//
//  Recipe.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let instructions: String
    let imageURL: String
//    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case instructions = "strInstructions"
        case imageURL = "strDrinkThumb"
//        case tags
    }
}

struct MockData {
    
    static let sampleRecipe = Recipe(
        id: "0001",
        name: "Long Island Tea",
        instructions: "Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.",
        imageURL: ".long_island_tea.jpeg"
//        tags: ["IBA", "CONTEMPORARYCLASSIC", "ALCOHOLIC", "USA", "ASIA", "VEGAN"]
    )
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe]
}
