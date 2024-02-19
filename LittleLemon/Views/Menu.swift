//
//  Menu.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/15/24.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isFirstAppearance = true
    @State private var searchText = ""
    @State private var selectedSortOption: sortBy? = nil 
    
    enum sortBy: String, CaseIterable {
        
        case starters = "Starters"
        case mains = "Mains"
        case desserts = "Desserts"
        case drinks = "Drinks"
        case all = "All"
       
    }
    
    var body: some View {
        
        VStack{
            Header()
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
                

                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                
            }
            .padding()
            .background(Color.littleLemonGreen)
            
            VStack(alignment: .leading){
                Text("ORDER FOR DELIVERY!")
                    .font(.system(size: 18,weight: .bold))
                ScrollView(.horizontal){
                    HStack{
                        ForEach(sortBy.allCases, id: \.self) {
                            option in
                            SortButton(title: option.rawValue, option: option, selectedOption: $selectedSortOption)
                                .padding(.horizontal, 6)
                        }
                    }
                }
            }
            .padding()
            
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.self) {
                        dish in
                        VStack(alignment: .leading){
                            Text(dish.title ?? "")
                                .bold()
                            HStack{
                                VStack(alignment: .leading){
                                    Text(dish.itemScript ?? "")
                                        .foregroundStyle(Color.littleLemonGreen)
                                    Text("$\(dish.price ?? "")")
                                        .bold()
                                        .foregroundStyle(Color.littleLemonGreen)
                                        .padding(.vertical, 5)
                                }
                                
                                Spacer()
                                AsyncImage(url: URL(string: dish.image!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 80, height: 80)
                            }
                            
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .onAppear{
                if isFirstAppearance {
                    getMenuData(viewContext: viewContext)
                    isFirstAppearance = false
                }
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
            return [NSSortDescriptor(key: "title",
                                           ascending: true,
                                            selector: #selector(NSString.localizedStandardCompare))]
       
    }
    
    func buildPredicate() -> NSPredicate {
        
        let searchText = searchText.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        
        let categoryPredicate: NSPredicate
        if let selectedSortOption = selectedSortOption, selectedSortOption != .all {
            categoryPredicate = NSPredicate(format: "category CONTAINS[cd] %@", selectedSortOption.rawValue)
        }else{
            categoryPredicate = NSPredicate(value: true)
        }

        return NSCompoundPredicate(andPredicateWithSubpredicates: [searchText, categoryPredicate])
        
    }
}

#Preview {
    Menu()
}
