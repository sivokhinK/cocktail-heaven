//
//  RecipeDataService.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 25.11.2023.
//

import Foundation

class RecipeDataService {
    
    private let allRecipesURLString          = "https://thecocktaildb.com/api/json/v1/1/search.php?f=a"
    private let recipesByNameURLString       = "https://thecocktaildb.com/api/json/v1/1/search.php?s="
    private let recipesByIngredientURLString = "https://thecocktaildb.com/api/json/v1/1/filter.php?i="
    private let recipeByIDURLString          = "https://thecocktaildb.com/api/json/v1/1/lookup.php?i="
    
    // TODO:
    // All these functions are basically the same.
    // Maybe make one with different parameters?
    
    func fetchAllRecipes() async -> [Recipe] {
        guard let url = URL(string: allRecipesURLString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let drinks = try JSONDecoder().decode(Drinks.self, from: data)
            return drinks.drinks
        } catch {
            print("ERROR \(error)")
            return []
        }
    }
    
    func fetchRecipeByName(string: String) async -> [Recipe] {
        guard let url = URL(string: recipesByNameURLString + string.lowercased()) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let drinks = try JSONDecoder().decode(Drinks.self, from: data)
            return drinks.drinks
        } catch {
            print("ERROR \(error)")
            return []
        }
    }
    
    func fetchRecipeByIngredient(string: String) async -> [Recipe] {
        guard let url = URL(string: recipesByIngredientURLString + string.lowercased()) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let drinks = try JSONDecoder().decode(Drinks.self, from: data)
            return drinks.drinks
        } catch {
            print("ERROR \(error)")
            return []
        }
    }
    
    func fetchRecipeByID(id: String) async -> RecipeDetailedJSON? {
        guard let url = URL(string: recipeByIDURLString + id.lowercased()) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let drinks = try JSONDecoder().decode(DrinksDetailed.self, from: data)
            return drinks.drinks[0]
        } catch {
            print("ERROR \(error)")
            return nil
        }
    }
}
