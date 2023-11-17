//
//  SearchView.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 01.11.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchField = "";
    @FocusState private var searchFieldIsFocused: Bool;
    @State private var buttonTapped = true;
    
    var body: some View {
        VStack {
            Text("Search")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 25)
                .padding(.bottom, 40)
            
            Text("How do you want to search?")
//                .font(.system(size: 22, weight: .semibold))
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack {
                Button() {
                    if !buttonTapped { buttonTapped.toggle() }
                } label: {
                    Text("Drink")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 147, height: 37)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(buttonTapped ? .activeButton : .inactiveButton)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                }
                
                Button {
                    if buttonTapped { buttonTapped.toggle() }
                } label: {
                    Text("Ingredient")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 147, height: 37)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(buttonTapped ? .inactiveButton : .activeButton))
            }
            
            HStack {
                Image(systemName: "magnifyingglass").padding(.leading, 14)
                
                TextField(text: $searchField) {
                    Text("Type your drink")
                }
                .focused($searchFieldIsFocused)
                .onSubmit { searchFieldIsFocused = false; }
            }
            .frame(width: 312, height: 50)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.inactiveButton)
                    .stroke(searchFieldIsFocused ? .searchFieldActiveStroke : .searchFieldStroke, lineWidth: 2)
            }
            .padding(.top, 15)
            .padding(.bottom, 12)
            
            ScrollView {
                ForEach(MockData.recipes) { recipe in
                    RecipeCell(recipe: recipe)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 11, trailing: 5))
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SearchView()
}
