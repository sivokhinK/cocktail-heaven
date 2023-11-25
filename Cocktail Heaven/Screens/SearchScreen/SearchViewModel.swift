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
    
    func fetchAllRecipes() async throws {
        self.recipes = try await service.fetchAllRecipes()
    }
}
