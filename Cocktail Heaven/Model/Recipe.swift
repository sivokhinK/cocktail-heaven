//
//  Recipe.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Recipe]
}

struct DrinksDetailed: Codable {
    let drinks: [RecipeDetailed]
}

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
    }
}

struct RecipeDetailed: Codable, Identifiable {
    let id: String
    let name: String
    let instructions: String
    let imageURL: String
    
    // API sends ingredients and measures like this
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case instructions = "strInstructions"
        case imageURL = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
    }
}

struct RecipeDetailedFixed: Identifiable {
    let id: String
    let name: String
    let instructions: String
    let imageURL: String
    let ingredients: [String]
    let measures: [String]
    
    init(recipe: RecipeDetailed) {
        self.id = recipe.id
        self.name = recipe.name
        self.instructions = recipe.instructions
        self.imageURL = recipe.imageURL
        
        // Handle ingredients
        let initialIngredients = [
            recipe.ingredient1, recipe.ingredient2, recipe.ingredient3,
            recipe.ingredient4, recipe.ingredient5, recipe.ingredient6,
            recipe.ingredient7, recipe.ingredient8, recipe.ingredient9,
            recipe.ingredient10, recipe.ingredient11, recipe.ingredient12,
            recipe.ingredient13, recipe.ingredient14, recipe.ingredient15
        ]
        
        var ingredients = [String]()
        for r in initialIngredients {
            guard let r = r else { break }
            ingredients.append(r)
        }
        self.ingredients = ingredients
        
        // Handle measures
        let initialMeasures = [
            recipe.measure1, recipe.measure2, recipe.measure3,
            recipe.measure4, recipe.measure5, recipe.measure6,
            recipe.measure7, recipe.measure8, recipe.measure9,
            recipe.measure10, recipe.measure11, recipe.measure12,
            recipe.measure13, recipe.measure14, recipe.measure15
        ]
        
        var measures = [String]()
        for m in initialMeasures {
            guard let m = m else { break }
            measures.append(m)
        }
        self.measures = measures
    }
}

struct MockData {
    
    static let sampleRecipe = Recipe(
        id: "0001",
        name: "Long Island Tea",
        imageURL: ".long_island_tea.jpeg"
//        tags: ["IBA", "CONTEMPORARYCLASSIC", "ALCOHOLIC", "USA", "ASIA", "VEGAN"]
    )
    
    static let sampleRecipeDetailed = RecipeDetailed(
        id: "11002",
        name: "Long Island Tea",
        instructions: "Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.", 
        imageURL: ".long_island_tea.jpeg",
        ingredient1: "Vodka",
        ingredient2: "Light rum",
        ingredient3: "Gin",
        ingredient4: "Tequila",
        ingredient5: "Lemon",
        ingredient6: "Coca-Cola",
        ingredient7: nil,
        ingredient8: nil,
        ingredient9: nil,
        ingredient10: nil,
        ingredient11: nil,
        ingredient12: nil,
        ingredient13: nil,
        ingredient14: nil,
        ingredient15: nil,
        measure1: "1/2 oz ",
        measure2: "1/2 oz ",
        measure3: "1/2 oz ",
        measure4: "1/2 oz ",
        measure5: "Juice of 1/2 ",
        measure6: "1 splash ",
        measure7: nil,
        measure8: nil,
        measure9: nil,
        measure10: nil,
        measure11: nil,
        measure12: nil,
        measure13: nil,
        measure14: nil,
        measure15: nil
    )
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe]
}
