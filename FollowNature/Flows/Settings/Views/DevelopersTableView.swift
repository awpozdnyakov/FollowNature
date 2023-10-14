//
//  DevelopersTableView.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct DevelopersTableView: View {
    
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2))
                VStack {
                    Link(destination: URL(string: L10n.urlAndrew)!) {
                        HStack {
                            Text(L10n.andrew)
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .padding(.leading, 20)
                        .frame(width: 400, height: 50, alignment: .leading)
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(Asset.Colors.greenLight.swiftUIColor)
                    Link(destination: URL(string: L10n.urlShamil)!) {
                        HStack {
                            Text(L10n.shamil)
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .padding(.leading, 20)
                        .frame(width: 400, height: 50, alignment: .leading)
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(Asset.Colors.greenLight.swiftUIColor)
                    Link(destination: URL(string: L10n.urlTilek)!) {
                        HStack {
                            Text(L10n.tilek)
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .padding(.leading, 20)
                        .frame(width: 400, height: 50, alignment: .leading)
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(Asset.Colors.greenLight.swiftUIColor)
                    Link(destination: URL(string: L10n.urlRehina)!) {
                        HStack {
                            Text(L10n.rehina)
                                .foregroundColor(Asset.Colors.green.swiftUIColor)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .padding(.leading, 20)
                        .frame(width: 400, height: 50, alignment: .leading)
                    }
                }
            }
            .frame(width: 400, height: 280)
            .cornerRadius(25)
            .padding(.bottom, 147)
        }
    }
}

struct DevelopersTableView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersTableView()
    }
}
