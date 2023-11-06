//
//  SearchView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchField = "";
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("How do you want to search?")
                
                HStack {
                    Button("Drink") {
                        
                    }
                    
                    Button("Ingredient") {
                        
                    }
                }
                
                TextField("Type your drink", text: $searchField)
                
//                List(MockData.recipes) { recipe in
//                    RecipeListCell(recipe: recipe)
//                }
                ScrollView {
                    ForEach(MockData.recipes) { recipe in
                        RecipeListCell(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
