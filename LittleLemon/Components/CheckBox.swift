//
//  Checkbox.swift
//  LittleLemon
//
//  Created by Lily Mekeel on 2/16/24.
//

import Foundation
import SwiftUI

struct Checkbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.littleLemonGreen))
                    .foregroundStyle(Color.white)

                configuration.label
            }
        })
    }
}
