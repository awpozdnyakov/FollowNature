//
//  PhotoPicker.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 15.10.2023.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var photo: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectImage = info[.editedImage] as? UIImage {
                self.parent.photo = selectImage
            }
            
            picker.dismiss(animated: true)
        }
    }
}
