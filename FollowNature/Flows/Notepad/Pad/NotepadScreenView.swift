//
//  NotepadScreenView.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 17.10.2023.
//

import SwiftUI

struct NotepadScreenView: View {
    @ObservedObject private var viewModel: NotepadViewModel
    
    init(viewModel: NotepadViewModel) {
        self.viewModel = viewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = Asset.Colors.greenLight.color
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18)], for: .normal)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                TextField(L10n.enterPlantName, text: $viewModel.searchText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                if viewModel.page == .lookingFor {
                    HStack{
                        Spacer()
                        
                        Button {
                            viewModel.searchedPlanstBy(name: viewModel.searchText)
                        } label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30))
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .padding(30)
                        }
                    }
                }
            }
            Picker("title", selection: $viewModel.page) {
                Text(L10n.selected)
                    .font(.system(size: 18, weight: .heavy))
                    .tag(PadPage.selected)
                Text(L10n.allSelected)
                    .font(.system(size: 18, weight: .heavy))
                    .tag(PadPage.lookingFor)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            if viewModel.page == .selected {
                ScrollView {
                    TabView {
                        LazyVStack(spacing: 18) {
                            ForEach(viewModel.plants) { cardData in
                                PlantCardView(
                                    plant: cardData,
                                    selected: .constant(true),
                                    select: {},
                                    details: {
                                        viewModel.showDetailScreen(
                                            plant: cardData,
                                            selected: viewModel.plants.contains(where: { $0.id == cardData.id })
                                        )}
                                )}
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: CGFloat(viewModel.plants.count * 223))
                }
            } else {
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(viewModel.currentPlant?.commonName ?? "")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                            Image(systemName: "ladybug")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 37)
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .disabled(true)
                        }
                        //                            Text("Похожие растения - список научных и ботанических имен: \n \(viewModel.currentPlant?.synonyms.joined(separator: ", "))")
                        Text(viewModel.currentPlant?.commonName ?? "")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                        Spacer()
                    }
                    AsyncImage(url: URL(string: viewModel.currentPlant?.imageURL ?? "")) { image in
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
                Spacer()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
        .padding(.bottom, 50)
        .ignoresSafeArea(.all)
    }
}

struct NotepadScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NotepadScreenView(viewModel: NotepadViewModel(router: .previewMock()))
    }
}
