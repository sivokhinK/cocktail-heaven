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
        VStack {
            Text("Search")
                .font(.system(size: 22, weight: .semibold))
                .padding(.top, 25)
                .padding(.bottom, 40)
            
            Text("How do you want to search?")
                .font(.system(size: 22, weight: .semibold))
            
            HStack {
                Button() {
                    // button action
                } label: {
                    Text("Drink")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 147, height: 37)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.activeButton)
//                        .shadow(color: Color.black.opacity(0.9), radius: 4, x: 4, y: 4)
                }
                
                Button {
                    
                } label: {
                    Text("Ingredient")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 147, height: 37)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.inactiveButton))
            }
            
            HStack {
                Image(systemName: "magnifyingglass").padding(.leading, 14)
                
                TextField(text: $searchField) {
                    Text("Type your drink")
                }
            }
            .frame(width: 312, height: 50)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.inactiveButton)
                    .stroke(.searchFieldStroke, lineWidth: 2)
            }
            .padding(.top, 15)
            .padding(.bottom, 12)
            
            ScrollView {
                ForEach(MockData.recipes) { recipe in
                    RecipeCell(recipe: recipe)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 11, trailing: 5))
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
