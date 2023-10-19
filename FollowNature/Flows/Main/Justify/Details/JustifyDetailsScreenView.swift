//
//  JustifyDetailsScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 19.10.2023.
//

import SwiftUI

struct JustifyDetailScreenView: View {
    
    @ObservedObject var viewModel: JustifyDetailViewModel
    
    init(viewModel: JustifyDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            BackButton()
                .padding(.bottom, 5)
            if let imageURL = viewModel.plant.details.image.value {
                GeometryReader { geometry in
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            })
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 1.5)
                                .stroke(Asset.Colors.green.swiftUIColor, lineWidth: 3))
                }.frame(height: 430)
            }
            HStack {
                Text(viewModel.plant.name)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Button {
                    viewModel.select()
                    viewModel.loadPlants()
                } label: {
                    Image(systemName: "ladybug")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 53, height: 37)
                        .foregroundColor(viewModel.selected ? Asset.Colors.green.swiftUIColor : Asset.Colors.greenLight.swiftUIColor)
                        .background(Color.clear.padding(15))
                }
                .padding(.horizontal, 15)
            }
            Text(viewModel.translatedDescription ?? (viewModel.isFullDescriptionVisible ? viewModel.plant.details.description.value : String(viewModel.plant.details.description.value.prefix(700))))
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.black)
            if !viewModel.isTranslateButtonTapped {
                Button(action: {
                    viewModel.translateDescription()
                    viewModel.isTranslateButtonTapped.toggle() // this will set it to true
                }) {
                    HStack {
                        Spacer()
                        Text(L10n.showTranslate)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                            .bold()
                    }
                    .padding(.trailing)
                    .padding(.top, 0.5)
                }
            }
            if viewModel.plant.details.description.value.count > 500 {
                Button(action: {
                    viewModel.toggleDescriptionVisibility()
                }) {
                    HStack {
                        Spacer()
                        Text(L10n.showMore)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                    }
                    .padding(.trailing)
                    .padding(.top, 0.5)
                }
            }
            Divider()
                .frame(height: 1)
                .overlay(Asset.Colors.green.swiftUIColor)
            VStack(alignment: .leading, spacing: 7) {
                TaxonomyRow(title: L10n.taxonomy, value: viewModel.plant.details.taxonomy?.genus ?? "")
                TaxonomyRow(title: L10n.order, value: viewModel.plant.details.taxonomy?.order ?? "")
                TaxonomyRow(title: L10n.family, value: viewModel.plant.details.taxonomy?.family ?? "")
                TaxonomyRow(title: L10n.phylum, value: viewModel.plant.details.taxonomy?.phylum ?? "")
                TaxonomyRow(title: L10n.kingdom, value: viewModel.plant.details.taxonomy?.kingdom ?? "")
            }
            .padding(.vertical, 10)
            if viewModel.selected {
                GeometryReader { geometry in
                    Button(action: {
                        viewModel.unSelect()
                        viewModel.loadPlants()
                    }) {
                        Text(L10n.deleteFromFavorite)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width - 5, height: 50)
                            .background(Color.white)
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 1.5)
                                    .stroke(Color(red: 1, green: 0.01, blue: 0.01), lineWidth: 1))
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .padding(.horizontal, 15)
    }
}


struct JustifyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let imageUrl = URL(string: "https://s3-alpha-sig.figma.com/img/3d5d/a628/abddd9a7cdfd6f7ef0ef9e54ceb42347?Expires=1697414400&Signature=qPskkguYEejdb0XWDmT8wI1RbxFoNl70~s3Ec6SSd-oxugzJkbb1rBHIEbrKtTG6SrwUuVK7~dU6RKB1W5jwKMD9za98PTe7XkP0gN-21e83s5EcRUk5Wf4~Pdj1H1uwTeFnE3kzolqxPbW5~oCaXrJ~5e9vqXqlS4~WpfSm2rZJnhzjD69-GPXNR6YkB-CKjfXb6gkDFQ6Rr4ec14Auu429F3x56-DdUjYru9q97hBWGze95r5dtaB5eeXiI~3uYVqvotTwTxone7zoCHUrgC8eG4rOmYTzYbJ4Rr4A0zttX~YTTok6c7uFiCpsnHDK6H36zLtt5zc-ISGRZydvBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")
        
        let mockPlant = FormdataSuggestion(id: "1", name: "Flower flower", probability: 0.95, details: FormdataDetails(common_names: nil, taxonomy: Taxonomy(genus: "Leucojum", order: "Asparagales", family: "Amaryllidaceae", phylum: "Tracheophyta", kingdom: "Liliopsida"), url: nil, description: DescriptionValue(value: "In a world where socks mysteriously vanish from the dryer and Tupperware lids disappear into the abyss, one man named Bob made it his life’s mission to find the other half of his favorite pair of socks. Bob journeyed to the mysterious land of the Laundry Realm, passing by the towering Mountains of Mismatched Socks, and wading through the treacherous Sea of Lint. Along the way, he battled with the ferocious Static Cling Monster and outwitted the cunning Sock Gnomes. Just when he was about to give up, he discovered a hidden portal in his sock drawer that led to an alternate dimension—the dimension of the lost Tupperware lids! Who would have thought socks and lids were partying together?"), synonyms: nil, image: FormdataImage(value: imageUrl), rank: nil))
        
        let viewModel = PlantDetailViewModel(plant: mockPlant, selected: true, router: .previewMock())
        
        return NavigationView {
            PlantDetailScreenView(viewModel: viewModel)
                .previewLayout(.sizeThatFits)
        }
    }
}



