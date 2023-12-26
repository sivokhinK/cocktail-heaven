//
//  SearchViewModel.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 25.11.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    private let service = RecipeDataService()
    
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
}
