//
//  LoaderView.swift
//  FollowNature
//
//  Created by Macbook on 11.10.2023.
//

import SwiftUI

struct LoaderView: View {
    
    var body: some View {
        VStack {
            BackButton()
                .ignoresSafeArea(.all)
                .padding(.bottom, 10)
            Spacer()
        }
    }
}

struct SelectedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
