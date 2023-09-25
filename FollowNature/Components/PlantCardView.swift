//
//  PlantCardView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct PlantCardView: View {
    
    private let name: String
    private let image: URL?
    private let description: String
    private let select: () -> Void
    private let details: () -> Void
//    @Binding private var selected: Bool
    
    init(
        name: String,
        image: URL?,
        description: String,
        select: @escaping () -> Void,
        details: @escaping () -> Void
//        selected: Binding<Bool>
    ) {
        self.name = name
        self.image = image
        self.description = description
        self.select = select
        self.details = details
//        self._selected = selected
    }
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(name)
                    Spacer()
                    Button {
                        self.select()
//                        self.selected.toggle()
                    } label: {
                        Image(systemName: "ladybug")
                            .resizable()
                            .foregroundColor(
//                                selected ? Asset.Colors.green.swiftUIColor :
                                    Asset.Colors.greenLight.swiftUIColor)
                    }
                    .frame(width: 33, height: 37)
                }
                Text(description)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.details()
                    } label: {
                        Text("Detail")
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
            } placeholder: {
                Image(asset: Asset.Images.follow)
            }
            .frame(width: 185, height: 185, alignment: .center)
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
}

//struct PlantCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantCardView(name: "Flower", image: nil, description: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae.", select: {}, details: {}, selected: .constant(true))
//    }
//}
