//
//  CellularFillingViewModel.swift
//  DemiurgShambabmukli
//
//  Created by nikita on 12.08.2024.
//

import SwiftUI

class CellularFillingViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var cells: [CellModel] = []
    private var lastLifeIndex: Int? = nil
    
    // MARK: - Private properties
    private var lastThreeCreatedCells: [CellModel] = []
    
    // MARK: - Public methods
    func createCell() {
        let aliveChance = Int.random(in: 0...1)
        addCell(aliveChance == 1 ? .alive : .dead)
    }
    
    // MARK: - Private methods
    private func addCell(_ type: CellModel.CellType) {
        SwiftUI.withAnimation {
            let cell = CellModel(type: type)
            cells.append(cell)
            lastThreeCreatedCells.append(cell)
            
            if lastThreeCreatedCells.count > 3 {
                lastThreeCreatedCells.remove(at: 0)
            }
            
            if let cell = lastThreeCreatedCells.first, lastThreeCreatedCells.count == 3 {
                let isEqual = lastThreeCreatedCells.dropFirst().allSatisfy { $0.type == cell.type }
                if isEqual {
                    if cell.type == .alive {
                        cells.append(.init(type: .life))
                        lastLifeIndex = cells.count - 1
                        lastThreeCreatedCells = []
                    } else if let lastLifeIndex, cell.type == .dead {
                        cells.remove(at: lastLifeIndex)
                        lastThreeCreatedCells = []
                    }
                }
            }
        }
    }
}
