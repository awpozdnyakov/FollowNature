//
//  PlantDetailView.swift
//  FollowNature
//
//  Created by ti1ek on 01.10.2023.
//

import SwiftUI

struct PlantDetailView: View {
    
    @ObservedObject var viewModel: PlantDetailViewModel
    
    private let select: () -> Void
    @Binding var selected: Bool
    
    init(
        select: @escaping () -> Void,
        selected: Binding<Bool>,
        viewModel: PlantDetailViewModel
    ) {
        self.select = select
        self._selected = selected
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
                            }
                        )
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.12, green: 0.71, blue: 0.59), lineWidth: 3)
                        )
                }
                .frame(height: 430)
            }
            
            HStack {
                Text(viewModel.plant.name)
                    .font(Font.custom("Inter", size: 36)
                        .weight(.bold)
                    )
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    self.select()
                    selected.toggle()
                } label: {
                    Image(systemName: "ladybug")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 33, height: 37)
                .foregroundColor(selected ? Asset.Colors.green.swiftUIColor : Asset.Colors.greenLight.swiftUIColor)
                .padding(.all, 15)
            }
            
            
            
            Text(viewModel.isFullDescriptionVisible ? viewModel.plant.details.description.value : String(viewModel.plant.details.description.value.prefix(500)))
                .font(Font.custom("Inter", size: 18))
                .foregroundColor(.black)
            
            if viewModel.plant.details.description.value.count > 500 {
                Button(action: {
                    viewModel.toggleDescriptionVisibility()
                }) {
                    HStack {
                        Spacer()
                        Text(viewModel.isFullDescriptionVisible ?
                             "Показать меньше" : "Показать больше")
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                    }
                    .padding(.trailing)
                    .padding(.top, 0.5)
                }
            }
            Divider()
                .background(Asset.Colors.green.swiftUIColor)
            
            VStack(alignment: .leading, spacing: 7) {
                TaxonomyRow(title: "Класс:", value: viewModel.plant.details.taxonomy.type)
                TaxonomyRow(title: "Род:", value: viewModel.plant.details.taxonomy.genus)
                TaxonomyRow(title: "Порядок:", value: viewModel.plant.details.taxonomy.order)
                TaxonomyRow(title: "Семейство:", value: viewModel.plant.details.taxonomy.family)
                TaxonomyRow(title: "Тип:", value: viewModel.plant.details.taxonomy.phylum)
                TaxonomyRow(title: "Царство:", value: viewModel.plant.details.taxonomy.kingdom)
            }
            GeometryReader { geometry in
                Button(action: {
                    selected.toggle()
                }) {
                    Text("Убрать из списка “Выбраное”")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black) // Text color
                        .frame(width: geometry.size.width - 5, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .inset(by: 1.5)
                                .stroke(Color(red: 1, green: 0.01, blue: 0.01), lineWidth: 3)
                        )
                }
            }
            .padding(.bottom, 50)
            .padding(.top, 34)
        }
        //.padding(.top, 97)
    }
}

struct TaxonomyRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("Inter", size: 24).weight(.bold))
                .foregroundColor(Color(red: 0.12, green: 0.71, blue: 0.59))
            
            Text(value)
                .font(Font.custom("Inter", size: 22).weight(.medium))
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let imageUrl = URL(string: "https://s3-alpha-sig.figma.com/img/3d5d/a628/abddd9a7cdfd6f7ef0ef9e54ceb42347?Expires=1697414400&Signature=qPskkguYEejdb0XWDmT8wI1RbxFoNl70~s3Ec6SSd-oxugzJkbb1rBHIEbrKtTG6SrwUuVK7~dU6RKB1W5jwKMD9za98PTe7XkP0gN-21e83s5EcRUk5Wf4~Pdj1H1uwTeFnE3kzolqxPbW5~oCaXrJ~5e9vqXqlS4~WpfSm2rZJnhzjD69-GPXNR6YkB-CKjfXb6gkDFQ6Rr4ec14Auu429F3x56-DdUjYru9q97hBWGze95r5dtaB5eeXiI~3uYVqvotTwTxone7zoCHUrgC8eG4rOmYTzYbJ4Rr4A0zttX~YTTok6c7uFiCpsnHDK6H36zLtt5zc-ISGRZydvBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")
        
        let mockPlant = FormdataSuggestion(id: "1", name: "Flower flower", probability: 0.95, details: FormdataDetails(common_names: nil, taxonomy: Taxonomy(type: "Liliopsida", genus: "Leucojum", order: "Asparagales", family: "Amaryllidaceae", phylum: "Tracheophyta", kingdom: "Liliopsida"), url: nil, description: DescriptionValue(value: "Leucojum vernum, называемый весенней снежинкой, - вид цветковых растений семейства Амариллисовые. Он произрастает в Центральной и Южной Европе от Бельгии до Украины. Он считается натурализованным в северо-западной Европе, включая Великобританию и некоторые районы Скандинавии, а также в американских штатах Джорджия и Флорида. Этот весеннецветущий луковичный травянистый многолетник выращивается как декоративное растение на солнечном месте. Растение размножается в благоприятных условиях, образуя кустики. Каждое растение несет по одному белому цветку с зеленоватыми отметинами на кончике листочка околоцветника, на стебле высотой около 10-20 см (3,9–7,9 дюйма), иногда больше.Латинский специфический эпитет vernum означает относящийся к весне. Его близкий родственник, Leucojum aestivum, цветет летом."), synonyms: nil, image: FormdataImage(value: imageUrl), rank: nil))
        
        let viewModel = PlantDetailViewModel(plant: mockPlant)
        
        return NavigationView {
            PlantDetailView(select: {}, selected: .constant(true), viewModel: viewModel)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

