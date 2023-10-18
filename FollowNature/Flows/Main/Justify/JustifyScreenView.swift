//
//  JustifyScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 30.09.2023.
//

import SwiftUI
import XCoordinator

struct JustifyScreenView: View {
    @ObservedObject private var viewModel: JustifyViewModel
    
    init(viewModel: JustifyViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            HStack {
                BackButton()
                Spacer()                    
            }
            .padding(.horizontal, 15)
            TabView {
                LazyVStack(spacing: 18) {
                    ForEach(viewModel.justifyPlants) { cardData in
                        JustifyCardView(
                            name: cardData.name,
                            image: cardData.details.image.value,
                            description: cardData.details.description.value,
                            select: {},
                            details: {viewModel.showDetailScreen(
                                plant: cardData,
                                selected: viewModel.plants.contains(where: { $0.id == cardData.id })
                            )},
                            progress: cardData.probability)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: CGFloat(viewModel.justifyPlants.count * 223))
        }
        .navigationTitle("Точность совпадения").font(.system(size: 28, weight: .bold))
    }
}

struct JustifyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        JustifyScreenView(viewModel: JustifyViewModel(justifyPlants: [FormdataSuggestion(id: "", name: "Tree", probability: 98, details: FormdataDetails(common_names: nil, taxonomy: nil, url: nil, description: DescriptionValue(value: "Very interesting"), synonyms: nil, image: FormdataImage(value: nil), rank: nil))], router: .previewMock()))
    }
}
