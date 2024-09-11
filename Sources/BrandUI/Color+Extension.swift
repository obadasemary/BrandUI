//
//  Color+Extension.swift
//  
//
//  Created by Abdelrahman Mohamed on 11/09/2024.
//

import SwiftUI

extension Color {
    static let dodgerBlue = fromARGB(0xFF2196F3) // 4282466370 color code in hex
    
    static func fromARGB(_ argb: UInt32) -> Color {
        let alpha = Double((argb >> 24) & 0xFF) / 255.0
        let red = Double((argb >> 16) & 0xFF) / 255.0
        let green = Double((argb >> 8) & 0xFF) / 255.0
        let blue = Double(argb & 0xFF) / 255.0
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
