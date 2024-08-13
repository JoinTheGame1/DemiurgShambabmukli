//
//  Color + hex.swift
//  DemiurgShambabmukli
//
//  Created by nikita on 12.08.2024.
//

import SwiftUI

extension Color {
    init?(hex: String) {

        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        guard let color = UInt64(hexString, radix: 16) else { return nil }

        if hexString.count == 6 {
            let red = Double(Int(color >> 16) & 0x0000FF) / 255
            let green = Double(Int(color >> 8) & 0x0000FF) / 255
            let blue = Double(Int(color) & 0x0000FF) / 255
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        } else {
            return nil
        }
    }
}
