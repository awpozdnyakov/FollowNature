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
                Spacer()
                Button {
                    viewModel.showImagePicker = true
                } label: {
                    Image(asset: Asset.Images.follow)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                }
                .sheet(isPresented: $viewModel.showImagePicker, onDismiss: loadPhoto, content: {
                    PhotoPicker(photo: $viewModel.selectedMedia, sourceType: .library)
                })
                Spacer()
                Button {
                    viewModel.showImagePicker = true
                } label: {
                    Text(L10n.chooseAPhoto)
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
                .sheet(isPresented: $viewModel.showImagePicker, onDismiss: loadPhoto, content: {
                    PhotoPicker(photo: $viewModel.selectedMedia, sourceType: .cam)
                })
                .padding(.all, 20)
                Spacer()
            }
            if viewModel.isModalPresented {
                LevelsInfoModalView()
                    .onTapGesture {
                        viewModel.isModalPresented = false
                    }
            }
            // Loader
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.4))
                    .ignoresSafeArea(.all)
                    .padding(.bottom, 5)
            }
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
