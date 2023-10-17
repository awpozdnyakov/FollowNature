//
//  SelectedButton.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct SelectedButton: View {
    
    var body: some View {
        VStack {
            NavigationLink(destination: SelectedScreenView()) {
                HStack(spacing: 23) {
                    Image(systemName: "ladybug")
                        .resizable()
                        .frame(width: 40, height: 42)
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                    Text(L10n.mySelected)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity)
                .frame(alignment: .leading)
            }
        }
    }
}
