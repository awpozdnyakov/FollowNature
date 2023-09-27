//
//  JustifyCardView.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 28.09.2023.
//

import SwiftUI

struct JustifyCardView: View {
    
    private let progress: CGFloat
    
    init(progress: CGFloat) {
        self.progress = progress * 10
    }
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 60, height: 60)
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Asset.Colors.green.swiftUIColor, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 60, height: 60)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 0.5), value: progress)
                VStack{
                    Text(String(format: "%.0f/10", progress * 10))
                        .font(.system(size: 18))
                        .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                }
            }
            .padding(.top, 65)
            .padding(.bottom, 30)
        }
    }
}

struct JustifyCardView_Previews: PreviewProvider {
    static var previews: some View {
        JustifyCardView(progress: 0.786/10)
    }
}
