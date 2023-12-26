//
//  RecipeDataService.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 25.11.2023.
//

import Foundation

class RecipeDataService {
    
    private let allRecipesURLString = "https://thecocktaildb.com/api/json/v1/1/search.php?f=a"
    private let drinkURLString = "https://thecocktaildb.com/api/json/v1/1/search.php?s="
    
    func fetchAllRecipes() async -> [Recipe] {
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
    
    func fetchRecipeByName(string: String) async -> [Recipe] {
        guard let url = URL(string: drinkURLString + string.lowercased()) else { return [] }
        
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
