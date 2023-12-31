//
//  SearchViewModel.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 25.11.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var recipeDetailed: RecipeDetailedJSON?
    
    @Published var searchField = ""
    @Published var buttonTapped = true
    @Published var firstLaunch = true
    
    private let service = RecipeDataService()
    
    // TODO: rewrite to fetchRecipesStartingWith(letter: string)
    func fetchAllRecipes() async {
        let recipes = await service.fetchAllRecipes()
        await MainActor.run {
            self.recipes = recipes
        }
    }
    
    func fetchRecipeByName(string: String) async {
        let recipes = await service.fetchRecipeByName(string: string)
        await MainActor.run {
            self.recipes = recipes
        }
    }
    
    func fetchRecipesByIngredient(string: String) async {
        let recipes = await service.fetchRecipeByIngredient(string: string)
        await MainActor.run {
            self.recipes = recipes
        }
    }
    
    func fetchRecipeByID(string: String) async {
        let recipe = await service.fetchRecipeByID(id: string)
        await MainActor.run {
            self.recipeDetailed = recipe
        }
    }
}
