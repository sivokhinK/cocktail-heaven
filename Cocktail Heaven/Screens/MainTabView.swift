//
//  ContentView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 30.10.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem { Label("", systemImage: "house") }
            
            FavoritesView()
                .tabItem { Label("", systemImage: "person") }
            
            NewRecipeView()
                .tabItem { Label("", systemImage: "plus") }
        }
    }
}

#Preview {
    MainTabView()
}
