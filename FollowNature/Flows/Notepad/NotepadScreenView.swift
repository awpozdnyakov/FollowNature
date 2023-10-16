//
//  NotepadScreenView.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 09.10.2023.
//

import SwiftUI

enum ConsultationPage: Int {
    case pending
    case finished
}
    
    
struct NotepadScreenView: View {
    
    @ObservedObject private var viewModel: NotepadViewModel
    
    init(viewModel: NotepadViewModel) {
        self.viewModel = viewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = Asset.Colors.green.color
    }
    @State private var searchText: String = ""
    @State var page = ConsultationPage.pending
    
    var body: some View {
        VStack(spacing: 0) {
            TextField(L10n.enterPlantName, text: $searchText)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                .padding(.horizontal, 15)
                .padding(.top, 50)
                .padding(.bottom, 20)
            Picker("title", selection: $page) {
                Text(L10n.selected)
                    .tag(ConsultationPage.pending)
                Text(L10n.allSelected)
                    .tag(ConsultationPage.finished)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 15)
            if page == .pending {
                Text(L10n.clickOntheBugOrCreateYourSelectedList)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.top, 50)
                    .foregroundColor(.gray)
            } else {
                TabView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.plants) { cardData in
                            PlantCardView(name: cardData.name,
                                          image: cardData.details.image.value,
                                          description: cardData.details.description.value,
                                          select: {},
                                          details: {},
                                          selected: .constant(true))
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: CGFloat(viewModel.plants.count * 225 + 30))
            }
            Spacer()
        }
    }
}

struct NotepadScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NotepadScreenView(viewModel: NotepadViewModel(router: .previewMock()))
    }
}
