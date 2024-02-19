//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/15/24.
//

import SwiftUI

struct Onboarding: View {
    @State var isLoggedIn = false
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    let keyFirstName = "keyFirstName"
    let keyLastName = "keyLastName"
    let keyEmail = "keyEmail"
    let keyProfilePic = "keyProfilePic"
    let userIsLoggedIn = "userIsLoggedIn"

    
    var body: some View {
        NavigationStack{
            Image("Logo")
            Hero()
            VStack(alignment: .leading){
                Text("First name *")
                    .font(.system(size: 12))
                TextField("", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Last name *")
                    .font(.system(size: 12))
                TextField("", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Email *")
                    .font(.system(size: 12))
                TextField("", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                Spacer()
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: keyFirstName)
                        UserDefaults.standard.set(lastName, forKey: keyLastName)
                        UserDefaults.standard.set(email, forKey: keyEmail)
                        UserDefaults.standard.set(true, forKey: userIsLoggedIn)
                        UserDefaults.standard.set("ProfilePlaceholder", forKey: keyProfilePic)
                        isLoggedIn = true
                    }else{
                        
                    }
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.littleLemonYellow))
                .foregroundStyle(Color.littleLemonGreen)
                .navigationDestination(isPresented: $isLoggedIn) {
                    Home()
                    
                }
                    Spacer()
            }
            .onAppear{
                if UserDefaults.standard.bool(forKey: "userIsLoggedIn") {
                    isLoggedIn = true
                }
            }
        }
            .padding()
            Spacer()
        }
        
    }
}

#Preview {
    Onboarding()
}
