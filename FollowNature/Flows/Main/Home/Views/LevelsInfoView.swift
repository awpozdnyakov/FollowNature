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
        VStack {
            VStack(spacing: 0) {
// MARK: - First Row
                HStack {
                    Text("Твой уровень")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    Image(uiImage: Asset.Images.level.image)
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
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Rectangle()
                    .fill(Asset.Colors.greenLight.swiftUIColor)
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 0) {
// MARK: - Second Row
                    HStack(alignment: .bottom, spacing: 0) {
                        Spacer()
                        VStack {
                            Image(uiImage: Asset.Images.level.image)
                                .resizable()
                                .frame(width: 90, height: 90)
                            Text("0 поисков")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Asset.Colors.gray.swiftUIColor)
                            
                            Text(UserLevel.dilettante.rawValue)
                                .font(.system(size: 22, weight: .bold))
                        }
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 20))
                            .foregroundColor(Asset.Colors.greenLight.swiftUIColor)
                            .padding(.bottom, 65)
                        
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Spacer()
                            Image(uiImage: Asset.Images.level.image)
                                .resizable()
                                .frame(width: 110, height: 110)
                            Text("10 поисков")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Asset.Colors.gray.swiftUIColor)
                            
                            Text(UserLevel.intern.rawValue)
                                .font(.system(size: 22, weight: .bold))
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
                            Image(uiImage: Asset.Images.level.image)
                                .resizable()
                                .frame(width: 150, height: 150)
                            Text("50 поисков")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Asset.Colors.gray.swiftUIColor)
                            
                            Text(UserLevel.guru.rawValue)
                                .font(.system(size: 22, weight: .bold))
                                .padding(.bottom, 20)
                        }
                        
                        Image(systemName: "arrow.left")
                            .foregroundColor(Asset.Colors.greenLight.swiftUIColor)
                            .font(.system(size: 20))
                            .padding(.bottom, 75)
                            .padding(.trailing, 30)
                        
                        VStack {
                            Image(uiImage: Asset.Images.level.image)
                                .resizable()
                                .frame(width: 130, height: 130)
                            Text("30 поисков")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Asset.Colors.gray.swiftUIColor)
                            
                            Text(UserLevel.specialist.rawValue)
                                .font(.system(size: 22, weight: .bold))
                        }
                        .padding(.bottom, 20)
                        Spacer()
                    }
                    .padding(.bottom, 30)
                }
            }
            .frame(width: 400, height: 500)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .inset(by: 1)
                    .stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2)
                    .padding(.horizontal, 20)
            )
            Spacer()
        }
        .background(
            Color.white.opacity(0.9)
        )
    }
}

struct LevelsInfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsInfoModalView(isModalPresented: .constant(false))
    }
}

