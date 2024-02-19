//
//  MenuItemStruct.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/16/24.
//

import Foundation

struct MenuItem: Codable {
    let title: String
    let image: String
    let price: String
    let category: String
    let description: String
    
    enum codingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case category = "category"
        case description = "description"
    }
}
