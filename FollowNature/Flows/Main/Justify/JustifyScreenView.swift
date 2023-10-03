//
//  JustifyScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 30.09.2023.
//

import SwiftUI

struct JustifyScreenView: View {
    
    @ObservedObject private var viewModel: JustifyViewModel
    
    init(viewModel: JustifyViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            TabView {
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.plants) { cardData in
                        JustifyCardView(name: cardData.name, image: cardData.details.image.value, description: cardData.details.description.value, select: {}, details: {viewModel.showDetailScreen(plant: cardData)}, selected: $viewModel.selected, progress: cardData.probability)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: CGFloat(viewModel.plants.count * 225 + 30))
        }
        .navigationTitle("Точность совпадения:")
    }
}

//struct JustifyScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        JustifyScreenView(viewModel: JustifyViewModel(plants: <#[FormdataSuggestion]#>, router: .previewMock()))
//    }
//}
