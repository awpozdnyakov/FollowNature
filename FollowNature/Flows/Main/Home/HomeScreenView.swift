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
        VStack(spacing: 0) {
            HeaderView(level: viewModel.userLevel)
            Button {
                viewModel.showImagePicker = true
            } label: {
                Image(asset: Asset.Images.follow)
            }
            .padding(.vertical, -15)
            .sheet(isPresented: $viewModel.showImagePicker, onDismiss: loadPhoto, content: {
                PhotoPicker(photo: $viewModel.selectedMedia)
            })
            Button {
            } label: {
                HStack(spacing: 16) {
                    Text("|")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .frame(height: 55)
                        .padding(.leading)
                    Text("Введите название растения")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Asset.Colors.gray.swiftUIColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                )
            }
            .padding(.top, 20)
            .padding(.all, 15)
            ScrollView {
                TabView {
                    LazyVStack(spacing: 15) {
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
                .frame(height: CGFloat(viewModel.popularPlants.count * 220))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 30)
        .padding(.bottom, 18)
        .ignoresSafeArea(.all)
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
