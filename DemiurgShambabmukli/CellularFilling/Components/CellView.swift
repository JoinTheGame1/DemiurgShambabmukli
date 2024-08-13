//
//  CellView.swift
//  DemiurgShambabmukli
//
//  Created by nikita on 12.08.2024.
//

import SwiftUI

struct CellView: View {
    
    // MARK: - Properties
    let type: CellModel.CellType
    
    // MARK: - Main view
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            IconView()
            DescriptionView()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(BackgroundView())
    }
    
    // MARK: - Components
    @ViewBuilder
    private func IconView() -> some View {
        ZStack {
            LinearGradient(
                colors: [
                    type.iconBackgroundColors.first ?? .black,
                    type.iconBackgroundColors.second ?? .white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            Text(type.icon)
        }
        .clipShape(Circle())
        .frame(width: 40, height: 40)
    }
    
    @ViewBuilder
    private func DescriptionView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(type.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.black)
            Text(type.description)
                .font(.system(size: 14))
                .foregroundStyle(Color.black)
        }
    }
    
    @ViewBuilder
    private func BackgroundView() -> some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
    }
}

#Preview {
    CellView(type: .alive)
}
