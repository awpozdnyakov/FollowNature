//
//  HomeScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject private var viewModel: HomeViewModel
    
    let imageManager = ImageConverter()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(level: "Pro")
                .padding(.bottom, 10)
            Button {
                viewModel.showImagePicker = true
            } label: {
                Image(asset: Asset.Images.follow)
            }
            .padding(.vertical, 10)
            .sheet(isPresented: $viewModel.showImagePicker, onDismiss: loadPhoto, content: {
                PhotoPicker(photo: $viewModel.selectedMedia)
            })
            Button {
            } label: {
                Text("|")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 250 )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
            }
            .padding(.all, 15)
            ScrollView {
                TabView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.plants) { cardData in
                            PlantCardView(name: cardData.name,
                                          image: cardData.details.image.value,
                                          description: cardData.details.description.value,
                                          select: {},
                                          details: {
                                viewModel.showDetailScreen(plant: cardData)
                            },
                                          selected: $viewModel.selected)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: CGFloat(viewModel.plants.count * 225 + 30))
            }
        }
        .padding(.vertical, 40)
        .ignoresSafeArea()
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
