//
//  Header.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/16/24.
//

import SwiftUI

struct Header: View {
    @State var profilePic = UserDefaults.standard.string(forKey: "keyProfilePic") ?? "ProfilePlaceholder"
    @State var backButton = ""
    @State var isPresented = false

    
    var body: some View {
        HStack(alignment: .center){
            NavigationStack{
                Button{
                    isPresented = true
                } label: {
                    Image(backButton)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding()
                }
            }.navigationDestination(isPresented: $isPresented) {
                Home()
            }
            
                
            Image("Logo")
                .padding(.trailing)
            Image(profilePic)
                           .resizable()
                           .scaledToFit()
                           .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                           .padding()
        }.frame(height: 80)    }
}

#Preview {
    Header()
}
