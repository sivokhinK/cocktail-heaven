//
//  ContentView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 30.10.2023.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            SearchView()
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "house")
                    } else {
                        Image(systemName: "house").environment(\.symbolVariants, .none)
                    }
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    if selection == 2 {
                        Image(systemName: "heart")
                    } else {
                        Image(systemName: "heart").environment(\.symbolVariants, .none)
                    }
                }
                .tag(2)
            
            NewRecipeView()
                .tabItem { Label("", systemImage: "plus") }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
