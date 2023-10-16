//
//  HeaderView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var isModalPresented = false
    private let level: UserLevel
    
    init(level: UserLevel) {
            self.level = level
        }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 13) {
                HStack {
                    Text(L10n.yourLevel)
                        .font(.system(size: 20))
                    Text(level.rawValue)
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                    Spacer()
                    
                }
                Text(L10n.makeAPhoto)
                    .font(.system(size: 20))
            }
            .padding(.horizontal, 15)

            HStack(alignment: .top) {
                Spacer()
                Button(action: {
                    withAnimation {
                        isModalPresented.toggle()
                    }
                }) {
                    Image(uiImage: Asset.Images.level.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .padding(.bottom, 60)
                        .padding(.trailing, 5)
                }
            }
        }
        .padding(.bottom, 70)
        .padding(.trailing, 20)
        .fullScreenCover(isPresented: $isModalPresented) {
            LevelsInfoModalView(isModalPresented: $isModalPresented)
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(level: .specialist)
    }
}
