//
//  JustifyCardView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 28.09.2023.
//

import SwiftUI

struct JustifyCardView: View {
    private let name: String
    private let image: URL?
    private let description: String
    private let select: () -> Void
    private let details: () -> Void
    private let progress: CGFloat
        
    init(
        name: String,
        image: URL?,
        description: String,
        select: @escaping () -> Void,
        details: @escaping () -> Void,
        progress: CGFloat
    ) {
        self.name = name
        self.image = image
        self.description = description
        self.select = select
        self.details = details
        self.progress = progress
    }
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(name)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    buildJustifySection()
                }
                Text(description)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                Spacer()
                HStack {
                    Button {
                        self.details()
                    } label: {
                        HStack {
                            Spacer()
                            Text(L10n.details)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                            Spacer()
                        }
                        .frame(height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2))
                    }
                }
            }
            AsyncImage(url: image) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(asset: Asset.Images.follow)
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 170, height: 170, alignment: .center)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 0.7))
        }
        .padding(.all, 15)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.white))
                .shadow(color: Asset.Colors.green.swiftUIColor.opacity(1.5), radius: 3)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .inset(by: 0.25)
                        .stroke(Asset.Colors.green.swiftUIColor
                            .opacity(0.15), lineWidth: 0.5)
                )
        )
        .padding(.horizontal, 15)
        .frame(height: 205)
        .frame(maxWidth: .infinity)
        .scaledToFit()
    }
    
    @ViewBuilder
    private func buildJustifySection() -> some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(Asset.Colors.greenLight.swiftUIColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Asset.Colors.green.swiftUIColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 0.5), value: progress)
                VStack{
                    Text(String(format: "%.3f", progress))
                        .font(.system(size: 17))
                        .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                }
            }
        }
    }
}

struct JustifyCardView_Previews: PreviewProvider {
    static var previews: some View {
        JustifyCardView(name: "Leucojum vernum", image: nil, description: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae.", select: {}, details: {}, progress: 0.78)
    }
}
