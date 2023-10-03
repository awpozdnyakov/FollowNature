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
                .font(Font.custom("Inter", size: 24).weight(.bold))
                .foregroundColor(Color(red: 0.12, green: 0.71, blue: 0.59))
            Text(value)
                .font(Font.custom("Inter", size: 22).weight(.medium))
                .foregroundColor(.black)
            Spacer()
        }
    }
}
