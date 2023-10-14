//
//  SettingsHeaderView.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct SettingsHeaderView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 150)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2))
            Image(systemName: "tree.fill")
                .resizable()
                .foregroundColor(Asset.Colors.green.swiftUIColor)
                .frame(width: 100, height: 100)
        }
    }
}

struct SettingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHeaderView()
    }
}
