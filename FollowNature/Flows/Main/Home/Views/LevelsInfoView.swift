//
//  LevelsInfoView.swift
//  FollowNature
//
//  Created by ti1ek on 15.10.2023.
//

import SwiftUI

enum UserLevel: String, CaseIterable {
    case dilettante = "Дилетант"
    case intern = "Стажер"
    case specialist = "Специалист"
    case guru = "Гуру"
    
    static func determineLevel(from searches: Int) -> UserLevel {
        switch searches {
        case 0:
            return .dilettante
        case 1..<10:
            return .intern
        case 10..<30:
            return .specialist
        default:
            return .guru
        }
    }
}

struct LevelsInfoModalView: View {

    @Binding var isModalPresented: Bool

    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .light))
            VStack {
                VStack(spacing: 0) {
                    // MARK: - First Row
                    HStack {
                        Text(L10n.yourLevel)
                            .font(.system(size: 26, weight: .bold))
                            .padding(.top, 25)
                        Spacer()
                        Image(asset: Asset.Images.level)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            .onTapGesture {
                                withAnimation {
                                    isModalPresented = false
                                }
                            }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Asset.Colors.greenLight.swiftUIColor)

                    VStack(spacing: 0) {
                        // MARK: - Second Row
                        HStack(alignment: .bottom, spacing: 0) {
                            Spacer()
                            VStack {
                                Image(asset: Asset.Images.level)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                Text(L10n.zeroSearch)
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Asset.Colors.gray.swiftUIColor)

                                Text(UserLevel.dilettante.rawValue)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            Spacer()
                            Image(systemName: "arrow.right")
                                .font(.system(size: 20))
                                .foregroundColor(Asset.Colors.greenLight.swiftUIColor)
                                .padding(.bottom, 65)
                            Spacer()
                            VStack(spacing: 0) {
                                Spacer()
                                Image(asset: Asset.Images.level)
                                    .resizable()
                                    .frame(width: 110, height: 110)
                                Text(L10n.tenSearch)
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Asset.Colors.gray.swiftUIColor)

                                Text(UserLevel.intern.rawValue)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            Spacer()
                        }
                        Image(systemName: "arrow.down")
                            .foregroundColor(Asset.Colors.greenLight.swiftUIColor)
                            .font(.system(size: 20))
                            .padding(.leading, 200)
                            .padding(.top, 25)

                        // MARK: - Third Row
                        HStack(alignment: .bottom, spacing: 0) {
                            Spacer()
                            VStack {
                                Image(asset: Asset.Images.level)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                Text(L10n.fiftySearch)
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Asset.Colors.gray.swiftUIColor)
                                Text(UserLevel.guru.rawValue)
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.bottom, 20)
                            }
                            Image(systemName: "arrow.left")
                                .foregroundColor(Asset.Colors.greenLight.swiftUIColor)
                                .font(.system(size: 20))
                                .padding(.bottom, 75)
                                .padding(.trailing, 30)
                            VStack {
                                Image(asset: Asset.Images.level)
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                Text(L10n.thirtySearch)
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Asset.Colors.gray.swiftUIColor)
                                Text(UserLevel.specialist.rawValue)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .padding(.bottom, 20)
                            Spacer()
                        }
                        .padding(.bottom, 30)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .inset(by: 1)
                        .stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2)
                )
                .padding(.horizontal, 15)
                Spacer()
            }
        }
    }
}

struct LevelsInfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsInfoModalView(isModalPresented: .constant(false))
    }
}

