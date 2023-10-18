//
//  NotepadScreenView.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 17.10.2023.
//

import SwiftUI

struct NotepadScreenView: View {
    @ObservedObject private var viewModel: NotepadViewModel
    
    init(viewModel: NotepadViewModel) {
        self.viewModel = viewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = Asset.Colors.greenLight.color
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18)], for: .normal)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TextField(L10n.enterPlantName, text: $viewModel.searchText)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            Picker("title", selection: $viewModel.page) {
                Text(L10n.selected)
                    .font(.system(size: 18, weight: .heavy))
                    .tag(PadPage.selected)
                Text(L10n.allSelected)
                    .font(.system(size: 18, weight: .heavy))
                    .tag(PadPage.lookingFor)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 15)
            ScrollView {
                TabView(selection: $viewModel.page) {
                    ListPageView(plants: viewModel.plants,
                                 selected: .constant(true),
                                 select: {},
                                 details: {})
                    .tag(PadPage.selected)
                    ListPageView(plants: viewModel.plants,
                                 selected: .constant(true),
                                 select: {},
                                 details: {})
                    .tag(PadPage.lookingFor)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: CGFloat(viewModel.plants.count * 223))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
        .padding(.bottom, 50)
        .ignoresSafeArea(.all)
    }
}

struct NotepadScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NotepadScreenView(viewModel: NotepadViewModel(router: .previewMock()))
    }
}
