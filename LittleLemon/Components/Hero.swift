//
//  Hero.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/19/24.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Little Lemon")
                .font(.system(size: 45, weight: .semibold, design: .serif))
                .foregroundStyle(Color.littleLemonYellow)
            Text("Chicago")
                .font(.system(size: 30, design: .serif))
                .foregroundStyle(Color.white)
            HStack{
                Text("""
                    We are a family owned
                    Mediterranean restaurant,
                    focused on traditional
                    recipes served with a
                    modern twist.
                    """)
                .foregroundStyle(Color.white)
                .padding(.vertical)
                Spacer()
                Image("Hero image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 125,height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                
            }
            .frame(height: 150, alignment: .top)
        }
        .padding()
        .background(Color.littleLemonGreen)
        
        
    }
}

#Preview {
    Hero()
}
