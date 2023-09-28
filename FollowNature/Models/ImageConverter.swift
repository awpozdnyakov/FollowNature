//
//  ImageConverter.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 29.09.2023.
//

import SwiftUI

class ImageConverter {
    
    func base64ToImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        return UIImage(data: imageData)
    }
    
    func imageToBase64(_ image: UIImage) -> String? {
        return image.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
