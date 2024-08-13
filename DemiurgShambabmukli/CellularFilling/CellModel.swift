//
//  CellModel.swift
//  DemiurgShambabmukli
//
//  Created by nikita on 12.08.2024.
//

import Foundation
import SwiftUI

struct CellModel: Identifiable {
    
    enum CellType {
        case life
        case alive
        case dead
        
        var name: String {
            switch self {
            case .life: "Жизнь"
            case .alive: "Живая"
            case .dead: "Мёртвая"
            }
        }
        
        var description: String {
            switch self {
            case .life: "Ку-ку!"
            case .alive: "и шевелится!"
            case .dead: "или прикидывается"
            }
        }
        
        var icon: String {
            switch self {
            case .life: "🐣"
            case .alive: "💥"
            case .dead: "💀"
            }
        }
        
        var iconBackgroundColors: (first: Color?, second: Color?) {
            switch self {
            case .life: (Color(hex: "#AD00FF"), Color(hex: "#FFB0E9"))
            case .alive: (Color(hex: "#FFB800"), Color(hex: "#FFF7B0"))
            case .dead: (Color(hex: "#0D658A"), Color(hex: "#B0FFB4"))
            }
        }
    }
    
    let id = UUID()
    let type: CellType
}
