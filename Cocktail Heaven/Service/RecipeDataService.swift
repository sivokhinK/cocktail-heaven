//
//  RecipeDataService.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 25.11.2023.
//

import Foundation

class Drinks: Codable {
    let drinks: [Recipe]
}

class RecipeDataService {
    
    private var allRecipesURLString = "https://thecocktaildb.com/api/json/v1/1/search.php?f=b"
    
    func fetchAllRecipes() async throws -> [Recipe] {
        guard let url = URL(string: allRecipesURLString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let drinks = try JSONDecoder().decode(Drinks.self, from: data)
            return drinks.drinks
        } catch {
            print("Error \(error)")
            return []
        }
    }
}
