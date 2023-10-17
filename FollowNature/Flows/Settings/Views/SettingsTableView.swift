//
//  SettingsTableView.swift
//  FollowNature
//
//  Created by Macbook on 11.10.2023.
//

import SwiftUI

struct SettingsTableView: View {
    
    @ObservedObject private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Asset.Colors.greenLight.swiftUIColor, lineWidth: 2))
            VStack(alignment: .leading) {
                HStack(spacing: 23) {
                    Text("12")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                    Text(L10n.requests)
                        .font(.system(size: 18, weight: .medium))
                }
                .padding(.leading, 25)
                .padding(.top, 20)
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                SelectedButton()
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                ConnectionButton(openDevelopersTable: $viewModel.openDevelopersTable)
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                Spacer()
                Divider()
                    .frame(height: 1)
                    .overlay(Asset.Colors.greenLight.swiftUIColor)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 380)
        .padding(.horizontal, 15)
    }
}

struct SettingsTableView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTableView(viewModel: SettingsViewModel(router: .previewMock()))
    }
}
