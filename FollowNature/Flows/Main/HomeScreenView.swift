//
//  HomeScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject private var viewModel: HomeViewModel
    @State private var selectedMedia: UIImage?
    @State private var profileImage: Image?
    let imageManager = ImageConverter()


    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(level: "Pro")
            Button {
            } label: {
                Image(asset: Asset.Images.follow)
            }
            .padding(.vertical, 10)
            Button {
            } label: {
                Text("|")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .frame(height: 60)
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
                            PlantCardView(name: cardData.name, image: cardData.image, description: cardData.details, select: {}, details: {})
                        }

                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: CGFloat(viewModel.plants.count * 225 + 125))
            }
        }
    }
    
}

class ImageConverter {
    
    func base64ToImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        return UIImage(data: imageData)
    }
    
    func imageToBase64(_ image: UIImage) -> String? {
        return image.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
    
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}
