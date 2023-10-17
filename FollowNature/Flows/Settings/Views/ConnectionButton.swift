//
//  ConnectionButton.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import SwiftUI

struct ConnectionButton: View {
    
    @Binding var openDevelopersTable: Bool
    
    init(openDevelopersTable: Binding<Bool>) {
        self._openDevelopersTable = openDevelopersTable
    }

    var body: some View {
        VStack {
            Button {
                withAnimation {
                    openDevelopersTable = true
                }
            } label: {
                HStack(spacing: 23) {
                    Image(systemName: "ellipsis.message")
                        .resizable()
                        .frame(width: 40, height: 37)
                        .foregroundColor(Asset.Colors.green.swiftUIColor)
                    Text(L10n.connection)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
            }
        }
    }
}
