//
//  ListPageView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 17.10.2023.
//

import SwiftUI

struct ListPageView: View {
    private let plants: [FormdataSuggestion]
    @Binding var selected: Bool
    private let select: () -> Void
    private let details: () -> Void
    
    init(
        plants: [FormdataSuggestion],
        selected: Binding<Bool>,
        select: @escaping () -> Void,
        details: @escaping () -> Void
    ) {
        self.plants = plants
        self._selected = selected
        self.select = select
        self.details = details
    }
    
    var body: some View {
        if !(plants.isEmpty) {
                LazyVStack(spacing: 18) {
                    ForEach(plants) { cardData in
                        PlantCardView(plant: cardData,
                                      selected: $selected,
                                      select: { select() },
                                      details: { details() })
                    }
                }
        } else {
            Text(L10n.clickOntheBugOrCreateYourSelectedList)
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding(.top, 50)
                .foregroundColor(.gray)
        }
    }
}
