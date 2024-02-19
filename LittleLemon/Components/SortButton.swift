//
//  SortButton.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/19/24.
//

import SwiftUI

struct SortButton: View {
    var title: String = "button"
    var option: Menu.sortBy
    @Binding var selectedOption: Menu.sortBy?
    
    var body: some View {
        Button{
            selectedOption = option
        } label: {
            Text(title)
                .bold()
                .foregroundStyle(Color.littleLemonGreen)
        }
        .padding(6)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.accentGray))
        
        
        
    }
}

