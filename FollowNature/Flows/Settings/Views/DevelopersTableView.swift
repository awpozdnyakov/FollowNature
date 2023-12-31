//
//  DevelopersTableView.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct DevelopersTableView: View {
    
    var body: some View {
        VisualEffectView(effect: UIBlurEffect(style: .extraLight))
            .edgesIgnoringSafeArea(.all)
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 4))
            VStack {
                Link(destination: URL(string: L10n.urlAndrew)!) {
                    HStack {
                        Text(L10n.andrew)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                            .font(.system(size: 26, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(height: 47, alignment: .leading)
                }
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                Link(destination: URL(string: L10n.urlShamil)!) {
                    HStack {
                        Text(L10n.shamil)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                            .font(.system(size: 26, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(height: 47, alignment: .leading)
                }
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                Link(destination: URL(string: L10n.urlTilek)!) {
                    HStack {
                        Text(L10n.tilek)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                            .font(.system(size: 26, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(height: 47, alignment: .leading)
                }
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                Link(destination: URL(string: L10n.urlRehina)!) {
                    HStack {
                        Text(L10n.rehina)
                            .foregroundColor(Asset.Colors.green.swiftUIColor)
                            .font(.system(size: 26, weight: .medium))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(height: 47, alignment: .leading)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(25)
        .frame(height: 280)
        .padding(.horizontal, 15)
    }
}

struct DevelopersTableView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersTableView()
    }
}
