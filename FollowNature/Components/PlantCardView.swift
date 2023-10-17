//
//  PlantCardView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct PlantCardView: View {
    
    private let plant: FormdataSuggestion
    //    @Binding var plants: [FormdataSuggestion]
    @Binding var selected: Bool
    private let select: () -> Void
    private let details: () -> Void
    
    init(
        plant: FormdataSuggestion,
        //        plants: Binding<[FormdataSuggestion]>,
        selected: Binding<Bool>,
        select: @escaping () -> Void,
        details: @escaping () -> Void
    ) {
        self.plant = plant
        //        self._plants = plants
        self._selected = selected
        self.select = select
        self.details = details
    }
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(plant.name)
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                    Button {
                        select()
                    } label: {
                        Image(systemName: "ladybug")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 33, height: 37)
                    .foregroundColor(selected ? Asset.Colors.green.swiftUIColor : Asset.Colors.greenLight.swiftUIColor)
                }
                Text(plant.details.description.value)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                Spacer()
                Button {
                    details()
                } label: {
                    HStack {
                        Spacer()
                        Text(L10n.details)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                        
                        Spacer()
                    }.frame(height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2))
                }
            }
            AsyncImage(url: plant.details.image.value) { image in
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
        .frame(maxWidth: .infinity)
        .scaledToFit()
    }
}

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardView(plant: FormdataSuggestion(id: "", name: "Leucojum vernum", probability: 0.95, details: FormdataDetails(common_names: nil, taxonomy: nil, url: nil, description: DescriptionValue(value: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae."), synonyms: nil, image: FormdataImage(value: nil), rank: nil)), selected: .constant(true), select: {}, details: {})
    }
}
