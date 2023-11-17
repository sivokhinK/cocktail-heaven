//
//  FavoritesView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        
        VStack {
            Text("Favorites")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 25)
                .padding(.bottom, 40)
            
            ScrollView {
                ForEach(MockData.recipes) { recipe in
                    RecipeCell(recipe: recipe)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 11, trailing: 5))
                }
            }
            .scrollIndicators(.hidden)
        }
//        NavigationView {
//            List(MockData.recipes) { recipe in
//                RecipeCell(recipe: recipe)
//            }
//        }
    }
}

#Preview {
    FavoritesView()
}
