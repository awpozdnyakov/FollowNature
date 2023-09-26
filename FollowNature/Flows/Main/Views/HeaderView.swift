//
//  HeaderView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HeaderView: View {
    
    private let level: String
    
    init (
        level: String
    ) {
        self.level = "Pro"
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Твой уровень")
                    .font(.system(size: 22))
                Text(level)
                    .font(.system(size: 22, weight: .heavy))
                    .foregroundColor(Asset.Colors.green.swiftUIColor)
                Spacer()
                Button {
                } label: {
                    Image(uiImage: Asset.Images.follow.image)
                        .resizable()
                        .frame(width: 45, height: 45)
                }
            }
            Text("Сделай фото чтобы повысить его!")
                .font(.system(size: 22))
        }
        .padding(.horizontal, 15)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(level: "Pro")
    }
}
