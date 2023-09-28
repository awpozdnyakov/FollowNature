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
    
    @Binding var selected: Bool
    
    init(
        name: String,
        image: URL?,
        description: String,
        select: @escaping () -> Void,
        details: @escaping () -> Void,
        selected: Binding<Bool>,
        progress: CGFloat
    ) {
        self.name = name
        self.image = image
        self.description = description
        self.select = select
        self.details = details
        self._selected = selected
        self.progress = progress
    }
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(name)
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                    buildJustifySection()
                }
                Text(description)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.details()
                    } label: {
                        Text(L10n.details)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                            .frame(width: 70, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Asset.Colors.green.swiftUIColor, lineWidth: 2)
                            )
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
        }
        .padding(.all, 15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Asset.Colors.green.swiftUIColor, lineWidth: 2)
        )
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
        .scaledToFit()
    }
    
    @ViewBuilder
    private func buildJustifySection() -> some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Asset.Colors.green.swiftUIColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 0.5), value: progress)
                VStack{
                    Text(String(format: "%.0f/10", progress * 10))
                        .font(.system(size: 17))
                        .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                }
            }
        }
    }
}

struct JustifyCardView_Previews: PreviewProvider {
    static var previews: some View {
        JustifyCardView(name: "Leucojum vernum", image: nil, description: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae.", select: {}, details: {}, selected: .constant(true), progress: 0.78)
    }
}
