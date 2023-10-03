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
                    viewModel.showMediaPicker = true
            } label: {
                Image(asset: Asset.Images.follow)
            }
            .padding(.vertical, 10)
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
        .sheet(isPresented: $viewModel.showMediaPicker, onDismiss: loadPhoto, content: {
            MediaPicker(photo: $viewModel.selectedMedia)
        })
    }
}

extension HomeScreenView {
    func loadPhoto() {
        guard let selectedMedia = viewModel.selectedMedia else {return}
        //        guard let photoBase64 = imageManager.imageToBase64(selectedMedia) else {return}
        //        viewModel.pushBase64Photo(photo: PhotoBase64Model(images: [photoBase64], latitude: 49.207, longitude: 16.608, similar_images: true))
        viewModel.pushFormdataPhoto(photo: selectedMedia)
        print("Photo sent")
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var presentationMode: PresentationMode
    @Binding var photo: UIImage?
    
    init(presentationMode: Binding<PresentationMode>, photo: Binding<UIImage?>) {
        _presentationMode = presentationMode
        _photo = photo
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photo = uiImage
        presentationMode.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presentationMode.dismiss()
    }
}

struct MediaPicker: UIViewControllerRepresentable {
    
    @Binding var photo: UIImage?
    @Environment(\.presentationMode)
    
    var presentationMode
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, photo: $photo)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MediaPicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MediaPicker>) {
    }
    
}
