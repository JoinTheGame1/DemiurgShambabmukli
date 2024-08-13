//
//  ContentView.swift
//  DemiurgShambabmukli
//
//  Created by nikita on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @StateObject private var viewModel = CellularFillingViewModel()
    private let title = "Клеточное наполнение"
    
    // MARK: - Main view
    var body: some View {
        NavigationView {
            VStack {
                CellsListView()
                Spacer()
                CreateCellButtonView()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(.title2))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Components
    @ViewBuilder
    private func CellsListView() -> some View {
        Group {
            if viewModel.cells.isEmpty {
                Text("Мир пока пуст...")
                    .font(.system(.title))
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: .small) {
                            ForEach(viewModel.cells) { cell in
                                CellView(type: cell.type)
                            }
                        }
                        .padding(.big)
                }
                .defaultScrollAnchor(.bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BackgroundView())
    }
    
    @ViewBuilder
    private func CreateCellButtonView() -> some View {
        Button {
            viewModel.createCell()
        } label: {
            Text("СОТВОРИТЬ")
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Constants.createCellHeight)
        .padding(.vertical, .medium)
        .background {
            RoundedRectangle(cornerRadius: .medium)
                .foregroundStyle(Constants.commonPurpleColor)
        }
        .padding(.horizontal, .big)
    }
    
    @ViewBuilder
    private func BackgroundView() -> some View {
        LinearGradient(
            colors: [Constants.commonPurpleColor, .black],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
    
    enum Constants {
        static let createCellHeight: CGFloat = 40
        static let commonPurpleColor = Color(hex: "#310050") ?? .purple
    }
}

#Preview {
    ContentView()
}
