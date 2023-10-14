//
//  SettingsScreenView.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @ObservedObject private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 24) {
                    SettingsHeaderView()
                    SettingsTableView(viewModel: viewModel)
                }
                
                if viewModel.openDevelopersTable {
                    DevelopersTableView()
                        .onTapGesture {
                            withAnimation {
                                viewModel.openDevelopersTable = false
                            }
                        }
                }
            }
        }
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView(viewModel: SettingsViewModel(router: .previewMock()))
    }
}
