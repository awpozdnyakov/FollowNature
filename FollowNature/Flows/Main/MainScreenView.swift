//
//  MainScreenView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import SwiftUI

struct MainScreenView: View {
    
//    @ObservedObject private var viewModel: MainViewModel
//    
//    init(viewModel: MainViewModel) {
//        self.viewModel = viewModel
//    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(level: "Pro")
            Button {
            } label: {
                Image(asset: Asset.Images.follow)
            }
            .padding(.vertical, 10)
            Button {
            } label: {
                Text("|")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 250 )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
            }
            .padding(.all, 15)
            ScrollView {
//                TabView {
//                    LazyVStack(spacing: 16) {
//                        ForEach(plants) { cardData in
//                            PlantCardView(name: <#T##String#>, image: <#T##URL?#>, description: <#T##String#>, select: <#T##() -> Void#>, details: <#T##() -> Void#>, selected: <#T##Binding<Bool>#>)
//                        }
//
//                    }
//                }
//                .tabViewStyle(.page(indexDisplayMode: .never))
//                .frame(height: CGFloat(count * 110 + 15))
            }
        }
    }
    
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
