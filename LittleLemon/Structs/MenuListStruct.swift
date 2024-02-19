//
//  MenuListStruct.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/16/24.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
}


func getMenuData(viewContext: NSManagedObjectContext) {
    PersistenceController.shared.clear()
    
    let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
    
    let request = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request){
        data, response, error in
        if let data = data {
            do {
                let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data)
                
                if let menuItems = fullMenu?.menu {
                   
                    for menuItem in menuItems {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                        dish.category = menuItem.category
                        dish.itemScript = menuItem.description
                        
                        
                    }
                    try? viewContext.save()
                } else {
                    print("Error fetching menu data")
                }
            }
        }
    
    }
    task.resume()
}
