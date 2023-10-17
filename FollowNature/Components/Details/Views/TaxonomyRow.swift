//
//  TaxonomyRow.swift
//  FollowNature
//
//  Created by ti1ek on 01.10.2023.
//

import SwiftUI

struct TaxonomyRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Asset.Colors.green.swiftUIColor)
            Text(value)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
            Spacer()
        }
    }
}
