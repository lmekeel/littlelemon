//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/15/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @State var firstName = UserDefaults.standard.string(forKey: "keyFirstName") ?? "Enter first name"
    @State var lastName = UserDefaults.standard.string(forKey: "keyLastName") ?? "Enter last name"
    @State var email = UserDefaults.standard.string(forKey: "keyEmail") ?? "Enter email"
    @State var phone = UserDefaults.standard.string(forKey: "keyPhone") ?? "Enter phone number"
    
    @State private var orderStatus = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsletter = false
    
    @State var inputFirstName = ""
    @State var inputLastName = ""
    @State var inputEmail = ""
    @State var inputPhone = ""
    
    @State var isPresented = false
    
    @State var profilePic = UserDefaults.standard.string(forKey: "keyProfilePic")
    
    var body: some View {
        VStack{
            Header(backButton: "BackButton")
            
            GroupBox(label: Text("Personal information")) {
                HStack{
                    Text("Avatar")
                        .foregroundStyle(Color.gray)
                    Spacer()
                }
                .padding(.vertical, 5)
                
                HStack{
                    Image(profilePic ?? "Profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Button("Change"){
                        profilePic = "Profile"
                       
                    }
                    .padding(10)
                    .background(Color.littleLemonGreen)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    
                    Button("Remove"){
                        profilePic = "ProfilePlaceholder"
                        
                    }
                    .padding(10)
                    .background(Color.clear)
                    .foregroundColor(Color.gray)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.littleLemonGreen))
                    
                    Spacer()
                }
                .frame(height: 70)
                
                VStack(alignment: .leading){
                    Text("First name")
                        .font(.system(size: 12))
                    TextField(firstName, text: $inputFirstName)
                        .textFieldStyle(.roundedBorder)
                    Text("Last name")
                        .font(.system(size: 12))
                    TextField(lastName, text: $inputLastName)
                        .textFieldStyle(.roundedBorder)
                    Text("Email")
                        .font(.system(size: 12))
                    TextField(email, text: $inputEmail)
                        .textFieldStyle(.roundedBorder)
                    Text("Phone number")
                        .font(.system(size: 12)).font(.system(size: 12))
                    TextField(phone, text: $inputPhone)
                        .textFieldStyle(.roundedBorder)
                
                   
                }.frame(width: 350, alignment: .leading)
                
                
                VStack(alignment:.leading){
                    Text("Email notifications")
                        .bold()
                    Toggle(isOn: $orderStatus) {
                                Text("Order statuses")
                            .foregroundStyle(Color.littleLemonGreen)
                            }
                            .toggleStyle(Checkbox())
                    Toggle(isOn: $passwordChanges) {
                                Text("Password changes")
                            .foregroundStyle(Color.littleLemonGreen)
                            }
                            .toggleStyle(Checkbox())
                    Toggle(isOn: $specialOffers) {
                                Text("Special offers")
                            .foregroundStyle(Color.littleLemonGreen)
                            }
                            .toggleStyle(Checkbox())
                    Toggle(isOn: $newsletter) {
                                Text("Newsletter")
                            .foregroundStyle(Color.littleLemonGreen)
                            }
                            .toggleStyle(Checkbox())
                }
                .frame(width: 350, alignment: .leading)
    
                Button("Log out"){
                    UserDefaults.standard.set(false, forKey: "userIsLoggedIn")
                    self.presentation.wrappedValue.dismiss()
                }
                .frame(width: 340,height: 40)
                .background(Color.littleLemonYellow)
                .cornerRadius(8)
                .foregroundStyle(Color.black)
                
                HStack{
                    Button("Discard changes"){
                        clearForm()
                    }
                    .padding(10)
                    .background(Color.clear)
                    .foregroundColor(Color.gray)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.littleLemonGreen))
                    
                    Button("Save changes"){
                       saveChanges()
                    }
                    .padding(10)
                    .background(Color.littleLemonGreen)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    
                    
                }
               
            }
            .groupBoxStyle(PlainGroupBoxStyle())
            .padding(.horizontal)
            Spacer()
            
        }
    }
    
    private func saveChanges() {
        // Update the UserDefaults values
        UserDefaults.standard.set(inputFirstName, forKey: "keyFirstName")
        UserDefaults.standard.set(inputLastName, forKey: "keyLastName")
        UserDefaults.standard.set(inputEmail, forKey: "keyEmail")
        UserDefaults.standard.set(inputPhone, forKey: "keyPhone")
        UserDefaults.standard.set(profilePic, forKey: "keyProfilePic")
        
        isPresented = true
 
    }
    
    private func clearForm() {
        inputFirstName = ""
        inputLastName = ""
        inputEmail = ""
        inputPhone = ""
        
        // Reset other state variables if needed
        orderStatus = false
        passwordChanges = false
        specialOffers = false
        newsletter = false
    }
}




struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            HStack{
                configuration.label
                    .bold()
                Spacer()
            }
            configuration.content
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
    }
}

#Preview {
    UserProfile()
}
