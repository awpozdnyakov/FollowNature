//
//  HomeScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(level: viewModel.userLevel, isModalPresented: $viewModel.isModalPresented)
                Button {
                    viewModel.showImagePicker = true
                } label: {
                    Image(asset: Asset.Images.follow)
                }
                .sheet(isPresented: $viewModel.showImagePicker, onDismiss: loadPhoto, content: {
                    PhotoPicker(photo: $viewModel.selectedMedia)
                })
                Button(action: {
                    viewModel.showImagePicker = true
                }) {
                    Text("или выбери фото из галереи")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                        .padding()
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .inset(by: 1.5)
                                .stroke(Asset.Colors.green.swiftUIColor)
                        )
                }
                .padding(.all, 20)
                ScrollView {
                    TabView {
                        LazyVStack(spacing: 18) {
                            ForEach(viewModel.popularPlants) { cardData in
                                PlantCardView(
                                    plant: cardData,
                                    selected: .constant(true),
                                    select: {},
                                    details: {
                                        viewModel.showDetailScreen(
                                            plant: cardData,
                                            selected: viewModel.popularPlants.contains(where: { $0.id == cardData.id })
                                        )}
                                )}
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: CGFloat(viewModel.popularPlants.count * 223))
                }
                Spacer()
            }
            if viewModel.isModalPresented {
                LevelsInfoModalView()
                    .onTapGesture {
                        viewModel.isModalPresented = false
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 30)
        .padding(.bottom, 18)
        .ignoresSafeArea(.all)
        .onAppear {
            viewModel.loadPopularPlants()
        }
    }
}

extension HomeScreenView {
    func loadPhoto() {
        guard let selectedMedia = viewModel.selectedMedia else {return}
        viewModel.pushFormdataPhoto(photo: selectedMedia)
        print("Photo sent")
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}
