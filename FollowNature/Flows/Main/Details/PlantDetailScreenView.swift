//
//  PlantDetailScreenView.swift
//  FollowNature
//
//  Created by ti1ek on 01.10.2023.
//

import SwiftUI

struct PlantDetailScreenView: View {
    
    @ObservedObject var viewModel: PlantDetailViewModel
    @State private var isTranslateButtonTapped: Bool = false
    
    init(viewModel: PlantDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                                .stroke(Color(red: 0.12, green: 0.71, blue: 0.59), lineWidth: 3))
                }.frame(height: 430)
            }
            
            HStack {
                Text(viewModel.plant.name)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Button {
                    viewModel.selected.toggle()
                } label: {
                    Image(asset: Asset.Images.ladybug)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 53, height: 37)
                        .foregroundColor(viewModel.selected ? Asset.Colors.green.swiftUIColor : Asset.Colors.greenLight.swiftUIColor)
                        .background(Color.clear.padding(15))
                }
                .padding(.horizontal, 15)
            }
            
            Text(viewModel.translatedDescription ?? (viewModel.isFullDescriptionVisible ? viewModel.plant.details.description.value : String(viewModel.plant.details.description.value.prefix(500))))
                .font(.system(size: 18))
                .foregroundColor(.black)
            
            if viewModel.plant.details.description.value.count > 500 {
                if viewModel.isFullDescriptionVisible {
                    if !isTranslateButtonTapped {
                        Button(action: {
                            viewModel.translateDescription()
                            isTranslateButtonTapped.toggle() // this will set it to true
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
                    
                    
                } else {
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
            }
            
            Divider()
                .background(Asset.Colors.green.swiftUIColor)
            
            VStack(alignment: .leading, spacing: 7) {
                TaxonomyRow(title: L10n.taxonomy, value: viewModel.plant.details.taxonomy?.genus ?? "")
                TaxonomyRow(title: L10n.order, value: viewModel.plant.details.taxonomy?.order ?? "")
                TaxonomyRow(title: L10n.family, value: viewModel.plant.details.taxonomy?.family ?? "")
                TaxonomyRow(title: L10n.phylum, value: viewModel.plant.details.taxonomy?.phylum ?? "")
                TaxonomyRow(title: L10n.kingdom, value: viewModel.plant.details.taxonomy?.kingdom ?? "")
            }
            
            GeometryReader { geometry in
                Button(action: {
                    viewModel.selected.toggle()
                }) {
                    Text(L10n.deleteFromFavorite)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width - 5, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .inset(by: 1.5)
                                .stroke(Color(red: 1, green: 0.01, blue: 0.01), lineWidth: 3))
                }
            }
            .padding(.bottom, 50)
            .padding(.top, 34)
        }.padding(.horizontal, 15)
    }
}


struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let imageUrl = URL(string: "https://s3-alpha-sig.figma.com/img/3d5d/a628/abddd9a7cdfd6f7ef0ef9e54ceb42347?Expires=1697414400&Signature=qPskkguYEejdb0XWDmT8wI1RbxFoNl70~s3Ec6SSd-oxugzJkbb1rBHIEbrKtTG6SrwUuVK7~dU6RKB1W5jwKMD9za98PTe7XkP0gN-21e83s5EcRUk5Wf4~Pdj1H1uwTeFnE3kzolqxPbW5~oCaXrJ~5e9vqXqlS4~WpfSm2rZJnhzjD69-GPXNR6YkB-CKjfXb6gkDFQ6Rr4ec14Auu429F3x56-DdUjYru9q97hBWGze95r5dtaB5eeXiI~3uYVqvotTwTxone7zoCHUrgC8eG4rOmYTzYbJ4Rr4A0zttX~YTTok6c7uFiCpsnHDK6H36zLtt5zc-ISGRZydvBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")
        
        let mockPlant = FormdataSuggestion(id: "1", name: "Flower flower", probability: 0.95, details: FormdataDetails(common_names: nil, taxonomy: Taxonomy(genus: "Leucojum", order: "Asparagales", family: "Amaryllidaceae", phylum: "Tracheophyta", kingdom: "Liliopsida"), url: nil, description: DescriptionValue(value: "In a world where socks mysteriously vanish from the dryer and Tupperware lids disappear into the abyss, one man named Bob made it his life’s mission to find the other half of his favorite pair of socks. Bob journeyed to the mysterious land of the Laundry Realm, passing by the towering Mountains of Mismatched Socks, and wading through the treacherous Sea of Lint. Along the way, he battled with the ferocious Static Cling Monster and outwitted the cunning Sock Gnomes. Just when he was about to give up, he discovered a hidden portal in his sock drawer that led to an alternate dimension—the dimension of the lost Tupperware lids! Who would have thought socks and lids were partying together?"), synonyms: nil, image: FormdataImage(value: imageUrl), rank: nil))
        
        let viewModel = PlantDetailViewModel(plant: mockPlant, router: .previewMock())
        
        return NavigationView {
            PlantDetailScreenView(viewModel: viewModel)
                .previewLayout(.sizeThatFits)
        }
    }
}

///Leucojum vernum, называемый весенней снежинкой, - вид цветковых растений семейства Амариллисовые. Он произрастает в Центральной и Южной Европе от Бельгии до Украины. Он считается натурализованным в северо-западной Европе, включая Великобританию и некоторые районы Скандинавии, а также в американских штатах Джорджия и Флорида. Этот весеннецветущий луковичный травянистый многолетник выращивается как декоративное растение на солнечном месте. Растение размножается в благоприятных условиях, образуя кустики. Каждое растение несет по одному белому цветку с зеленоватыми отметинами на кончике листочка околоцветника, на стебле высотой около 10-20 см (3,9–7,9 дюйма), иногда больше.Латинский специфический эпитет vernum означает относящийся к весне. Его близкий родственник, Leucojum aestivum, цветет летом.
