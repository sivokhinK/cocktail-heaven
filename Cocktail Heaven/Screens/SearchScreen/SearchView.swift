//
//  SearchView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    @FocusState private var searchFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            MainTitleCH(title: "Search")
            
            Text("How do you want to search?")
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack {
                if viewModel.buttonTapped {
                    DrinkButtonSelected(buttonTapped: $viewModel.buttonTapped)
                    IngredientButton(buttonTapped: $viewModel.buttonTapped)
                } else {
                    DrinkButton(buttonTapped: $viewModel.buttonTapped)
                    IngredientButtonSelected(buttonTapped: $viewModel.buttonTapped)
                }
            }
            
            HStack {
                Image(systemName: "magnifyingglass").padding(.leading, 14)
                
                TextField("Type your drink", text: $viewModel.searchField)
                    .focused($searchFieldIsFocused)
                    .autocorrectionDisabled()
                    .onSubmit {
                        searchFieldIsFocused = false;
                        
                        if viewModel.buttonTapped {
                            Task {
                                await viewModel.fetchRecipeByName(string: viewModel.searchField)
                            }
                        } else {
                            Task {
                                await viewModel.fetchRecipesByIngredient(string: viewModel.searchField)
                            }
                        }
                    }
            }
            .standardTextFieldModifier(isFocused: searchFieldIsFocused)
            .padding(.top, 15)
            .padding(.bottom, 12)
            
            // TODO: Shouldn't images load from top to bottom?
            ScrollView {
                ForEach(viewModel.recipes) { recipe in
                    RecipeCell(recipe: recipe)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 11, trailing: 5))
                        .onTapGesture {
                            Task {
                                await viewModel.fetchRecipeByID(string: recipe.id)
                            }
                        }
                }
            }
            .scrollIndicators(.hidden)
            .task {
                if viewModel.firstLaunch {
                    await viewModel.fetchAllRecipes()
                    viewModel.firstLaunch = false
                }
            }
        }
        .sheet(item: $viewModel.recipeDetailed) { item in
            RecipeDetailView(recipe: RecipeDetailed(recipe: item))
        }
    }
}

#Preview {
    SearchView()
}
