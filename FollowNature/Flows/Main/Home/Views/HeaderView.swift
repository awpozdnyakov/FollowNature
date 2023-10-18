//
//  HeaderView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isModalPresented: Bool
    
    private let level: UserLevel
    
    init(
        level: UserLevel,
        isModalPresented: Binding<Bool>
    ) {
        self.level = level
        self._isModalPresented = isModalPresented
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation {
                    isModalPresented.toggle()
                }
            }) {
                HStack {
                    HStack {
                        Text(L10n.yourLevel)
                            .font(.system(size: 20))
                            .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                        Text(level.rawValue)
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                    }.padding(.top, 40)
                    Spacer()
                    Image(uiImage: Asset.Images.level.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .padding(.trailing, 5)
                }
            }
            Text(L10n.makeAPhoto)
                .font(.system(size: 20))
                .padding(.bottom, 60)
        }
        .padding(.horizontal, 15)
//        .fullScreenCover(isPresented: $isModalPresented) {
//            LevelsInfoModalView(isModalPresented: $isModalPresented)
//        }
    }
}

//
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(level: .specialist, isModalPresented: .constant(true))
    }
}
