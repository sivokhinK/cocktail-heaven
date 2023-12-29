//
//  MainTitleCH.swift
//  Cocktail Heaven
//
//  Created by Kirill Sivokhin on 28.12.2023.
//

import SwiftUI

struct MainTitleCH: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .padding(.top, 25)
            .padding(.bottom, 40)
    }
}

#Preview {
    MainTitleCH(title: "Search")
}
