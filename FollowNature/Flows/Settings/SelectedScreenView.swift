//
//  SelectedScreenView.swift
//  FollowNature
//
//  Created by Macbook on 11.10.2023.
//

import SwiftUI

struct SelectedScreenView: View {
    var body: some View {
        VStack {
            BackButton()
                .ignoresSafeArea(.all)
            Spacer()
        }
    }
}

struct SelectedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedScreenView()
    }
}
